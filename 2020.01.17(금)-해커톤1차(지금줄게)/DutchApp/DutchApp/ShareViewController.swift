//
//  ShareViewController.swift
//  DutchApp
//
//  Created by 홍기민 on 2020/01/15.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    private let hightTopLabel = UILabel()
    let reportingDateLabel = UILabel()
    
    private let clipView1 = UIView()
    private let totalLabel = UILabel()
    private let totalPrice = UILabel()
    
    private let devideSymbol = UILabel()
    private let totalPerson = UILabel()
    
    private let clipView2 = UIView()
    private let onePersonLabel = UILabel()
    private let onePersonPrice = UILabel()
    
    let clipView3 = UIView()
    private let depositLabel = UILabel()
    private let depositAccountLabel = UILabel()
    
    private let clipView4 = UIView()
    private let kakaoLabel = UILabel()
    private let kakaoUrl = UIButton()
    
    private let clipView5 = UIView()
    private let tossLabel = UILabel()
    private let tossUrl = UIButton()
    
    var receiveDate: String = ""
    var receiveSubject: String = ""
    var receiveTotalPrice: String = ""
    var receiveTotalPerson: String = ""
    var receiveTotalPriceN: String = ""
    var receiveDepositAccountLabel: String = ""
    var receiveKakaoUrl: String = "https://qr.kakaopay.com/281006011000028768635971"
    var receiveTossUrl: String = "https://toss.im/_m/9yGrGGNo"
    
    
    let shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if receiveDepositAccountLabel.count > 10 {
            clipView3.isHidden  = false
        } else {
            clipView3.isHidden  = true
        }
        
        view.addSubview(hightTopLabel)
        view.addSubview(reportingDateLabel)
        view.addSubview(clipView1)
        view.addSubview(devideSymbol)
        view.addSubview(totalPerson)
        view.addSubview(clipView2)
        view.addSubview(clipView3)
        view.addSubview(clipView4)
        view.addSubview(clipView5)
        view.addSubview(shareButton)
        
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        hightTopLabel.text = "\(receiveSubject)"
        totalPrice.text = amountToString(amount: "\(receiveTotalPrice)")! + "원"
        totalPerson.text = "\(receiveTotalPerson) 명"
        onePersonPrice.text = amountToString(amount: "\(receiveTotalPriceN)")! + "원"
        depositAccountLabel.text = "\(receiveDepositAccountLabel)"
        tossUrl.setTitle("\(receiveKakaoUrl)", for: .normal)
    }
    
    @objc func shareButtonAction(_sender: UIButton) {
        let totalPrice = amountToString(amount: "\(receiveTotalPrice)")!
        let NPrice = amountToString(amount: "\(receiveTotalPriceN)")!
        let text = """
        ##  \(receiveSubject)  ##\n
        총액: \(totalPrice) 원\n
        총 인원: \(receiveTotalPerson) 명\n
        1인당: 💵\(NPrice) 원💵\n
        계좌번호:"우리은행(홍기민) 1002433358721"\n
        Kakao송금하기\n
        \(receiveKakaoUrl)\n

        """
        let vc =  UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }
    
    
    @objc func kakaoButton(_sender: UIButton) {
        guard let url = URL(string: "\(receiveKakaoUrl)"), UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @objc func tossButton(_sender: UIButton) {
        guard let url = URL(string: "\(receiveTossUrl)"), UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension ShareViewController {
    func configure() {
        hightTopLabel.text = "\(receiveSubject)"
        hightTopLabel.font = UIFont(name: "NanumSquareRoundR", size: 40)
        
        reportingDateLabel.text = "\(receiveDate)"
        reportingDateLabel.font = UIFont(name: "NanumSquareRoundR", size: 15)
        
        totalLabel.text = "총액"
        totalLabel.font = UIFont(name: "NanumSquareRoundR", size: 25)
        clipView1.addSubview(totalLabel)
        
        totalPrice.text = "\(receiveTotalPrice) 원"
        totalPrice.font = UIFont(name: "NanumSquareRoundR", size: 25)
        clipView1.addSubview(totalPrice)
        
        devideSymbol.text = "➗"
        devideSymbol.font = UIFont(name: "NanumSquareRoundR", size: 25)
        totalPerson.text = "\(receiveTotalPerson) 명"
        totalPerson.font = UIFont(name: "NanumSquareRoundR", size: 25)
        
        onePersonLabel.text = "1인당"
        onePersonLabel.font = UIFont(name: "NanumSquareRoundR", size: 25)
        clipView2.addSubview(onePersonLabel)
        
        onePersonPrice.text = "\(receiveTotalPriceN) 원"
        onePersonPrice.font = UIFont(name: "NanumSquareRoundR", size: 25)
        clipView2.addSubview(onePersonPrice)
        
        depositLabel.text = "입금"
        depositLabel.font = UIFont(name: "NanumSquareRoundR", size: 25)
        clipView3.addSubview(depositLabel)
        
        depositAccountLabel.text = "\(receiveDepositAccountLabel)"
        depositAccountLabel.font = UIFont(name: "NanumSquareRoundR", size: 15)
        clipView3.addSubview(depositAccountLabel)
        
        kakaoLabel.text = "Kakao"
        kakaoLabel.font = UIFont(name: "NanumSquareRoundR", size: 25)
        clipView4.addSubview(kakaoLabel)
        
        kakaoUrl.setTitle("\(receiveKakaoUrl)", for: .normal)
        kakaoUrl.setTitleColor(.blue, for: .normal)
        kakaoUrl.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 11)
        kakaoUrl.addTarget(self, action: #selector(kakaoButton), for: .touchUpInside)
        clipView4.addSubview(kakaoUrl)
        
        tossLabel.text = "Toss"
        tossLabel.font = UIFont(name: "NanumSquareRoundR", size: 25)
        clipView5.addSubview(tossLabel)
        
        tossUrl.setTitle("\(receiveKakaoUrl)", for: .normal)
        tossUrl.setTitleColor(.blue, for: .normal)
        tossUrl.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 14)
        tossUrl.addTarget(self, action: #selector(tossButton), for: .touchUpInside)
        clipView5.addSubview(tossUrl)
        
        
        shareButton.setTitle("공유하기", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 35)
        shareButton.backgroundColor = #colorLiteral(red: 0, green: 0.7938875556, blue: 0.7916871309, alpha: 1)
        shareButton.layer.borderWidth = 7   //borderWidth 두께
        shareButton.layer.borderColor = #colorLiteral(red: 0, green: 0.7938875556, blue: 0.7916871309, alpha: 1)
        shareButton.layer.cornerRadius = 10
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        hightTopLabel.translatesAutoresizingMaskIntoConstraints = false
        hightTopLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        hightTopLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        reportingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        reportingDateLabel.topAnchor.constraint(equalTo: hightTopLabel.bottomAnchor, constant: 10).isActive = true
        reportingDateLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        clipView1.translatesAutoresizingMaskIntoConstraints = false
        clipView1.topAnchor.constraint(equalTo: hightTopLabel.bottomAnchor, constant: 20).isActive = true
        clipView1.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        clipView1.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        clipView1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraint(equalTo: clipView1.topAnchor).isActive = true
        totalLabel.leadingAnchor.constraint(equalTo: clipView1.leadingAnchor).isActive = true
        totalLabel.trailingAnchor.constraint(equalTo: clipView1.leadingAnchor).isActive = true
        totalLabel.bottomAnchor.constraint(equalTo: clipView1.bottomAnchor).isActive = true
        totalLabel.widthAnchor.constraint(equalTo: clipView1.widthAnchor, multiplier: 0.3).isActive = true
        
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.topAnchor.constraint(equalTo: clipView1.topAnchor).isActive = true
        totalPrice.centerXAnchor.constraint(equalTo: clipView1.centerXAnchor).isActive = true
        //        totalPrice.trailingAnchor.constraint(equalTo: clipView1.trailingAnchor).isActive = true
        totalPrice.bottomAnchor.constraint(equalTo: clipView1.bottomAnchor).isActive = true
        //        totalPrice.widthAnchor.constraint(equalTo: clipView1.widthAnchor, multiplier: 0.7).isActive = true
        //
        devideSymbol.translatesAutoresizingMaskIntoConstraints = false
        devideSymbol.topAnchor.constraint(equalTo: clipView1.bottomAnchor, constant: 10).isActive = true
        devideSymbol.centerXAnchor.constraint(equalTo: clipView1.centerXAnchor).isActive = true
        //        devideSymbol.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -150).isActive = true
        
        totalPerson.translatesAutoresizingMaskIntoConstraints = false
        totalPerson.topAnchor.constraint(equalTo: devideSymbol.bottomAnchor, constant: 10).isActive = true
        totalPerson.centerXAnchor.constraint(equalTo: clipView1.centerXAnchor).isActive = true
        //        totalPerson.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -150).isActive = true
        
        clipView2.translatesAutoresizingMaskIntoConstraints = false
        clipView2.topAnchor.constraint(equalTo: totalPerson.bottomAnchor, constant: 20).isActive = true
        clipView2.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        clipView2.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        clipView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onePersonLabel.translatesAutoresizingMaskIntoConstraints = false
        onePersonLabel.topAnchor.constraint(equalTo: clipView2.topAnchor).isActive = true
        onePersonLabel.leadingAnchor.constraint(equalTo: clipView2.leadingAnchor).isActive = true
        onePersonLabel.trailingAnchor.constraint(equalTo: clipView2.leadingAnchor).isActive = true
        onePersonLabel.bottomAnchor.constraint(equalTo: clipView2.bottomAnchor).isActive = true
        onePersonLabel.widthAnchor.constraint(equalTo: clipView2.widthAnchor, multiplier: 0.3).isActive = true
        
        onePersonPrice.translatesAutoresizingMaskIntoConstraints = false
        onePersonPrice.topAnchor.constraint(equalTo: clipView2.topAnchor).isActive = true
        onePersonPrice.centerXAnchor.constraint(equalTo: clipView1.centerXAnchor).isActive = true
        //        onePersonPrice.leadingAnchor.constraint(equalTo: onePersonLabel.trailingAnchor).isActive = true
        //        onePersonPrice.trailingAnchor.constraint(equalTo: clipView2.trailingAnchor).isActive = true
        onePersonPrice.bottomAnchor.constraint(equalTo: clipView2.bottomAnchor).isActive = true
        //        onePersonPrice.widthAnchor.constraint(equalTo: clipView2.widthAnchor, multiplier: 0.7).isActive = true
        
        
        
        clipView3.translatesAutoresizingMaskIntoConstraints = false
        clipView3.topAnchor.constraint(equalTo: clipView2.bottomAnchor, constant: 20).isActive = true
        clipView3.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        clipView3.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        clipView3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        depositLabel.translatesAutoresizingMaskIntoConstraints = false
        depositLabel.topAnchor.constraint(equalTo: clipView3.topAnchor).isActive = true
        depositLabel.leadingAnchor.constraint(equalTo: clipView3.leadingAnchor).isActive = true
        depositLabel.trailingAnchor.constraint(equalTo: clipView3.leadingAnchor).isActive = true
        depositLabel.bottomAnchor.constraint(equalTo: clipView3.bottomAnchor).isActive = true
        depositLabel.widthAnchor.constraint(equalTo: clipView3.widthAnchor, multiplier: 0.3).isActive = true
        
        depositAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        depositAccountLabel.topAnchor.constraint(equalTo: clipView3.topAnchor).isActive = true
        depositAccountLabel.leadingAnchor.constraint(equalTo: depositLabel.trailingAnchor).isActive = true
        depositAccountLabel.trailingAnchor.constraint(equalTo: clipView3.trailingAnchor).isActive = true
        depositAccountLabel.bottomAnchor.constraint(equalTo: clipView3.bottomAnchor).isActive = true
        depositAccountLabel.widthAnchor.constraint(equalTo: clipView3.widthAnchor, multiplier: 0.7).isActive = true
        
        clipView4.translatesAutoresizingMaskIntoConstraints = false
        clipView4.topAnchor.constraint(equalTo: clipView3.bottomAnchor, constant: 10).isActive = true
        clipView4.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        clipView4.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        clipView4.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        kakaoLabel.translatesAutoresizingMaskIntoConstraints = false
        kakaoLabel.topAnchor.constraint(equalTo: clipView4.topAnchor).isActive = true
        kakaoLabel.leadingAnchor.constraint(equalTo: clipView4.leadingAnchor).isActive = true
        kakaoLabel.trailingAnchor.constraint(equalTo: clipView4.leadingAnchor).isActive = true
        kakaoLabel.bottomAnchor.constraint(equalTo: clipView4.bottomAnchor).isActive = true
        kakaoLabel.widthAnchor.constraint(equalTo: clipView4.widthAnchor, multiplier: 0.3).isActive = true
        
        kakaoUrl.translatesAutoresizingMaskIntoConstraints = false
        kakaoUrl.topAnchor.constraint(equalTo: clipView4.topAnchor).isActive = true
        kakaoUrl.leadingAnchor.constraint(equalTo: kakaoLabel.trailingAnchor).isActive = true
        kakaoUrl.trailingAnchor.constraint(equalTo: clipView4.trailingAnchor).isActive = true
        kakaoUrl.bottomAnchor.constraint(equalTo: clipView4.bottomAnchor).isActive = true
        kakaoUrl.widthAnchor.constraint(equalTo: clipView4.widthAnchor, multiplier: 0.7).isActive = true
        
        clipView5.translatesAutoresizingMaskIntoConstraints = false
        clipView5.topAnchor.constraint(equalTo: clipView4.bottomAnchor, constant: 10).isActive = true
        clipView5.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        clipView5.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        clipView5.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tossLabel.translatesAutoresizingMaskIntoConstraints = false
        tossLabel.topAnchor.constraint(equalTo: clipView5.topAnchor).isActive = true
        tossLabel.leadingAnchor.constraint(equalTo: clipView5.leadingAnchor).isActive = true
        tossLabel.trailingAnchor.constraint(equalTo: clipView5.leadingAnchor).isActive = true
        tossLabel.bottomAnchor.constraint(equalTo: clipView5.bottomAnchor).isActive = true
        tossLabel.widthAnchor.constraint(equalTo: clipView5.widthAnchor, multiplier: 0.3).isActive = true
        
        tossUrl.translatesAutoresizingMaskIntoConstraints = false
        tossUrl.topAnchor.constraint(equalTo: clipView5.topAnchor).isActive = true
        tossUrl.leadingAnchor.constraint(equalTo: tossLabel.trailingAnchor).isActive = true
        tossUrl.trailingAnchor.constraint(equalTo: clipView5.trailingAnchor).isActive = true
        tossUrl.bottomAnchor.constraint(equalTo: clipView5.bottomAnchor).isActive = true
        tossUrl.widthAnchor.constraint(equalTo: clipView5.widthAnchor, multiplier: 0.7).isActive = true
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.topAnchor.constraint(equalTo: clipView5.bottomAnchor, constant: 40).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 120).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -120).isActive = true
        
    }
    
}
