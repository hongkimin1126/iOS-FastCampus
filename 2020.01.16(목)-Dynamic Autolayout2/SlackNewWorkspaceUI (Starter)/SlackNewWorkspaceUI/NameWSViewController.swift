//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import AudioToolbox.AudioServices
import UIKit

final class NameWSViewController: UIViewController {
  
  // MARK: Properties
  
  private let nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("Next", for: .normal)
    button.setTitleColor(.lightGray, for: .normal)
    button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected) //평소에는 노말이고 selected 상태에서만 이색이 나온다.  
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
    return button
  }()
  
  private let closeButton: UIButton = {
    let button = UIButton()
    let closeImage = UIImage(systemName: "xmark")
    button.setImage(closeImage, for: .normal)
    button.setPreferredSymbolConfiguration(.init(scale: .large), forImageIn: .normal)
    button.tintColor = .black
    button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
    return button
  }()
  
  private let wsNameTextField: UITextField = {
    let textField = UITextField()
    let attrString = NSAttributedString( //NSAttributedString???
      string: "Name your workspace",
      attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)] //.withAlphaComponent는 투명도 조절하는거
    )
    textField.attributedPlaceholder = attrString
    textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
    textField.enablesReturnKeyAutomatically = true //깂을 입력했을 때 키보드에 go가 활성화된다.
    textField.borderStyle = .none
    textField.returnKeyType = .go //키보드 리턴을 go로 변경하는거
    textField.autocorrectionType = .no  //autocorrectionType??????????????????////뭐야이거
    textField.autocapitalizationType = .none //autocapitalizationType 첫글자 대문자 하는거
    return textField
  }()
  
  private let floatingLabel: UILabel = {//floatingLabel함수에서는  눌렀을때 위로 올라가는 레이블을 만들려고 함.
    let label = UILabel()
    label.text = "Name your workspace"
    label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    label.alpha = 0.0 //처음에 안보이다가 보이면서 나타나는거라서 알파값을 0으로 주었다.
    return label
  }()
  private var floatingCenterYConst: NSLayoutConstraint! //레이블이 위로 올라갔다가 내려갔다가 해야되서 만듬 ???????????????????///뭐야 이것만 가지고 어떻게 올라갔다가 내려와??? 이무것도 어뵤는데?????
  
  private let indicatorView: UIActivityIndicatorView = {
    let indicatorView = UIActivityIndicatorView(style: .medium) //텍스트필드에 입력하고 go누르면 빙글빙글하는 인디케이터 만들어 주는기능
    indicatorView.hidesWhenStopped = true
    return indicatorView
  }()
    private var indicatorViewLeadingConst: NSLayoutConstraint! //글자에 따라서 빙글거리는 인디케이터를 이동시켜주는것.
  
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    wsNameTextField.becomeFirstResponder() //뷰가 나타날때 키보드띄워주는 기능
  }
  
  // MARK: - Setup
  
  private func setupViews() {
    view.backgroundColor = .white
    view.addSubviews([nextButton, closeButton])
    view.addSubviews([wsNameTextField, floatingLabel, indicatorView])
    
    navigationController?.navigationBar.isHidden = true //네비게이션바 숨기능 기능
    wsNameTextField.delegate = self
  }
  
  private func setupConstraints() {
    nextButton.layout.top().trailing(constant: -16)
    closeButton.layout.leading(constant: 16).centerY(equalTo: nextButton.centerYAnchor)
    wsNameTextField.layout.leading(constant: 16).trailing(constant: -16).centerY(constant: -115)
    
    // Floating Label
    floatingLabel.layout.leading(equalTo: wsNameTextField.leadingAnchor)
    
    let defaultCenterYConst = floatingLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor)
    defaultCenterYConst.priority = UILayoutPriority(500)
    defaultCenterYConst.isActive = true
    
    floatingCenterYConst = floatingLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor, constant: -30) //위에보다 30더 높은 위치
    floatingCenterYConst.priority = .defaultLow   // 250 처음에는 우선순위가 낮아서 적용안된다.
    floatingCenterYConst.isActive = true
    
    // indicatorView
    indicatorView.layout.centerY(equalTo: wsNameTextField.centerYAnchor)
    indicatorViewLeadingConst = indicatorView.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
    indicatorViewLeadingConst.isActive = true
  }
  
  
  // MARK: - Action Handle
  
  // import AudioToolbox.AudioServices  임포트 해야 진동가능
  private func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }
  
  @objc private func didTapNextButton(_ sender: UIButton) {
    guard nextButton.isSelected, let text = wsNameTextField.text else { return vibrate() } //셀렉트상태이고 텍스트가 있을때 아니라면 진동!!
    guard !indicatorView.isAnimating else { return } //인디케이터뷰가 작동중인지 확인. //애니매이션이 진행중이라면 실행하지 않으려고 만듬
    
    let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])//텍스트 사이즈 알아내는 기능 위에 인디케이터를 글자수에 따라서 이동시키려고 만듬
    indicatorViewLeadingConst.constant = textSize.width + 8 //글자크기의 +8위치에서 인디케이터가 돌아감.
    indicatorView.startAnimating()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
       self.indicatorView.stopAnimating() //1초뒤에 인디케이터 멈추게함
       let vc = UrlWSViewController()
       vc.workspaceName = text
       self.navigationController?.pushViewController(vc, animated: true)
     }
  }
  
  @objc private func didTapCloseButton(_ sender: UIButton) {
    dismiss(animated: true)
  }
}


// MARK: - UITextFieldDelegate

extension NameWSViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool { //textFieldShouldReturn 리턴키눌렀을때 동작
    didTapNextButton(nextButton)
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { //shouldChangeCharactersIn 텍스트필드에 변화가 생길때 반응 바뀌기전??
    let text = textField.text ?? "" //이건 왜 한거야?????
    let replacedText = (text as NSString).replacingCharacters(in: range, with: string) //이거 뭐야?????????????????????? 1시간40분 전후임
    nextButton.isSelected = !replacedText.isEmpty
    
    UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
      if replacedText.isEmpty {//텍스트가 비어있을때는 floatingLabel내려가고
        self.floatingCenterYConst.priority = .defaultLow
        self.floatingLabel.alpha = 0.0
      } else { //텍스트가 있을때는 floatingLabel 올라가고
        self.floatingCenterYConst.priority = .defaultHigh
        self.floatingLabel.alpha = 1.0
      }
      self.view.layoutIfNeeded() //????????????????뭐야이거?? layoutIfNeeded
    })
    return true
  }
}
