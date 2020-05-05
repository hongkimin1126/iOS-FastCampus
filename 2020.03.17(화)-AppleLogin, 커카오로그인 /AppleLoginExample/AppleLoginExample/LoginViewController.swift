//
//  LoginViewController.swift
//  AppleLoginExample
//
//  Created by Giftbot on 2020/03/17.
//  Copyright © 2020 Giftbot. All rights reserved.
//
import AuthenticationServices //애플로그인시 임포트해야한다.
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppleIDButton()
    }
    
    private func setupAppleIDButton() {
        
        if #available(iOS 13.0, *) {
            let appleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default,       authorizationButtonStyle: .black)
            appleIDButton.cornerRadius = 6.0 // 기본값:6
            appleIDButton.addTarget(self, action: #selector(didTapAppleIDButton(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(appleIDButton)
            stackView.arrangedSubviews.first?.isHidden = true //스토리보드에 원래있는 놈을 히든처리
        }
        
        
        
        
    }
    
    
    // MARK: Action
    
    @objc private func didTapAppleIDButton(_ sender: Any) {
        //apple버튼 request 설정
        //최초애플로그인시에 한번만 물어본다.
        //해당서비스에서 email, fullName 이 필요한 경우에만 설정해주면 되고
        //email, fullName 모두 필요 없을 경우 -> idrequest.requestedScopes = [] 로 구현.
        let idrequest = ASAuthorizationAppleIDProvider().createRequest()
        idrequest.requestedScopes = [.email, .fullName]
        
        //apple버튼 controller생성해서 request담고 delegate 2개 연결
        let authorizationController = ASAuthorizationController(authorizationRequests: [idrequest])
        authorizationController.delegate = self
        
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests() //실행시키는 메서드
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    //어떤 wiondow에 apple로그인을 창을 띄울것인지를 결정.
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}


extension LoginViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let idCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {return}
        
        guard let userToken = idCredential.identityToken,
        let tokenString = String(data: userToken, encoding: .utf8) else { return }
        print("=================\(tokenString)")

        let userID = idCredential.user // userID는 apple계정에 있는 유일한 고유값. 회원 탈퇴했다가 다시 가입해도 변하지 않는다.
        let familyName = idCredential.fullName?.familyName ?? "" // idrequest에서 요구하지 않을 경우 nil 반환.
        let givenName = idCredential.fullName?.givenName ?? ""   // idrequest에서 요구하지 않을 경우 nil 반환.
        let email = idCredential.email ?? ""                     // idrequest에서 요구하지 않을 경우 nil 반환.
        
        switch idCredential.realUserStatus {
        case .likelyReal:
            print("아마도 실제 사용자일 가능성이 높음")
        case .unknown:
            print("실제 사용자인지 봇인지 확실치 않음")
        case .unsupported:
            print("iOS가 아님. 이건 iOS에서만 지원")
        default:
            break
        }
        
        let user = User(token: userToken, id: userID, familyName: familyName, givenName: givenName, email: email)
        print(user)
        
        if let encodeData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodeData, forKey: "AppleData")
        }
        
        let vc = presentingViewController as! ViewController
        vc.user = user
        dismiss(animated: true)
        
    }
    
    //로그인이 안됐을때.
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        guard let error = error as? ASAuthorizationError else { return }
        
        switch error.code {
        case .unknown: //기기에 apple계정이 등록이 안되있을 경우.
            print("unknown")
        case .canceled: //
            print("canceled")
        case .invalidResponse: //서버통신 애러.
            print("invalidResponse")
        case .notHandled:
            print("notHandled")
        case .failed:
            print("failed")
        @unknown default:
            print("default")
        }
        
        
    }
    
}


