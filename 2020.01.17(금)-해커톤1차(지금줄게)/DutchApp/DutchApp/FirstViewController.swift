//
//  FirstViewController.swift
//  DutchApp
//
//  Created by MyMac on 2020/01/15.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class FirstViewController: UIViewController {
    
    private let xMargin: CGFloat = 20
    private let yMargin: CGFloat = 20
    private let UIMargin: CGFloat = 50
    private let Padding: CGFloat = 80
    
    private let dateTextButton: UIButton = {
        let button = UIButton()
        button.setTitle(dateToString(), for: .normal)
        button.backgroundColor = buttonColor
        button.addTarget(self, action: #selector(dateTextButtonAction(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 15)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.text = "항목"
        label.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return label
    }()
    
    private let itemTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "항목을 입력해주세요."
        textField.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return textField
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "금액"
        label.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return label
    }()
    
    private let amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "금액을 입력하세요."
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return textField
    }()
    
    private let numberOfPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "인원 수"
        label.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return label
    }()
    
    private let numberOfPersonTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "총 인원수를 입력하세요."
        textField.returnKeyType = .go
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return textField
    }()
    
    
    private let personSubStepper: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = buttonColor.cgColor
        button.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(buttonColor, for: .normal)
        button.addTarget(self, action: #selector(subButtonAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return button
    }()
    
    private let personAddStepper: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = buttonColor.cgColor
        button.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(buttonColor, for: .normal)
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return button
    }()
    
    private let recentlyUsedAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("최근사용계좌", for: .normal)
        button.backgroundColor = buttonColor
        button.addTarget(self, action: #selector(recentButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return button
    }()
    
    private let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "계좌정보"
        label.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return label
    }()
    
    private let bankButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("은행", for: .normal)
        button.setTitleColor(placeHolderColor, for: .normal)
        button.addTarget(self, action: #selector(bankButtonAction(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return button
    }()
    
    private let accountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "계좌번호"
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return textField
    }()
    
    private let accountHolderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예금주"
        textField.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return textField
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("계산", for: .normal)
        button.addTarget(self, action: #selector(calculateButtonAction), for: .touchUpInside)
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return button
    }()
    
    
    private let containerView = UIView()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private var place = ""
    private var selectedBank = ""
    private var numberOfPerson = 1
    private var amount = 0
    private var accountNo = ""
    private var accountHolder = ""
    private var reportingDate = dateToString()
    private var tossLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userArray = userDefault.array(forKey: "itemData") ?? []
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
          UserDefaults.standard.removeObject(forKey: key.description)
        }
        self.setNaviBar()
        self.setTabBar()
        navigationItem.title = "지금줄게"
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "NanumSquareRoundR", size: 20)
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs as [NSAttributedString.Key : Any]
        
        
        numberOfPersonTextField.delegate = self
        itemTextField.delegate = self
        amountTextField.delegate = self
        accountTextField.delegate = self
        accountHolderTextField.delegate = self
        setUpUI()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        place = ""
        selectedBank = ""
        numberOfPerson = 1
        amount = 0
        accountNo = ""
        accountHolder = ""
        reportingDate = dateToString()
        numberOfPersonTextField.text = nil
        itemTextField.text = place
        amountTextField.text = nil
        accountTextField.text = accountNo
        accountHolderTextField.text = accountHolder
        bankButton.setTitle("은행", for: .normal)
        bankButton.setTitleColor(placeHolderColor, for: .normal)

    }
}

//MARK: - TextFieldDelegate
extension FirstViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case amountTextField:
            return string == string.filter("0123456789,".contains)
        case accountTextField:
            return string == string.filter("0123456789".contains)
        default:
            print("pass")
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: buttonColor])
        }
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case amountTextField:
            guard let text = textField.text else { return }
            let amount = text.replacingOccurrences(of: ",", with: "")
            if amount.isEmpty {
                amountTextField.text = nil
            } else {
                self.amount = Int(amount)!
                amountTextField.text = amountToString(amount: amount)
            }
            
        default:
            print("pass")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case numberOfPersonTextField:
            if let text = textField.text, let intText = Int(text) {
                if intText < 2 {
                    textField.text = nil
                    numberOfPerson = 1
                } else {
                    numberOfPerson = intText
                }
                
            } else {
                textField.text = nil
            }
        case itemTextField:
            guard let text = textField.text else { return }
            place = text
        case amountTextField:
            guard let text = textField.text else { return }
            amount = amountReplace(text)
        case accountTextField:
            guard let text = textField.text else { return }
            accountNo = text
        case accountHolderTextField:
            guard let text = textField.text else { return }
            accountHolder = text
        default:
            print("Error")
        }
        UIView.animate(withDuration: 1) {
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case numberOfPersonTextField:
            guard let text = numberOfPersonTextField.text else { return false }
            numberOfPerson = Int(text) ?? 2
            
        case amountTextField:
            guard let text = textField.text else { return false }
            amount = amountReplace(text)
        case itemTextField:
            guard let text = textField.text else { return false }
            place = text
        default:
            print("Error")
        }
        return true
    }
}

// MARK: - ACTIONS
extension FirstViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    @objc private func recentButtonAction(_ sender: UIButton) {
        guard let userArray = userDefault.array(forKey: "itemData") else { return }
        var userAccount = [String]()
        var userAccountSet = Set<String>()
        var userAccountDict = [ItemData]()
        for i in userArray {
            guard let item = try? decoder.decode(ItemData.self, from: i as! Data) else { return }
            let accountString = accountFlat(item.selectedBank!, item.accountNumber!, item.accountHolder!)
            userAccount.append(accountString)
            userAccountSet.insert(accountString)
            userAccountDict.append(item)
        }
        let asp = ActionSheetStringPicker(title: "최근사용계좌", rows: Array(userAccountSet), initialSelection: 0, doneBlock: {
            picker, indexes, values in
            let bank = userAccountDict[indexes].selectedBank!
            let accountNumber = userAccountDict[indexes].accountNumber!
            let holder = userAccountDict[indexes].accountHolder!
            self.bankButton.setTitle(bank, for: .normal)
            self.bankButton.setTitleColor(.black, for: .normal)
            self.selectedBank = bank
            self.accountTextField.text = accountNumber
            self.accountNo = accountNumber
            self.accountHolderTextField.text = holder
            self.accountHolder = holder
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        asp?.setCancelButton(getBarButton("   취소   "))
        asp?.setDoneButton(getBarButton("   선택   "))
        asp?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        asp?.toolbarBackgroundColor = buttonColor
        asp?.show()
        
    }
    
    @objc private func bankButtonAction(_ sender: UIButton) {
        let asp = ActionSheetStringPicker(title: "은행목록", rows: bankArray, initialSelection: 0, doneBlock: {
            picker, indexes, values in
            if let v = values {
                let v = v as! String
                self.selectedBank = v
                sender.setTitle(v, for: .normal)
                sender.setTitleColor(.black, for: .normal)
            }
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        asp?.setCancelButton(getBarButton("   취소   "))
        asp?.setDoneButton(getBarButton("   선택   "))
        asp?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        asp?.toolbarBackgroundColor = buttonColor
        asp?.show()
    }
    
    private func TFemptyAction() -> Bool {
        var emptyTFArray = [UITextField]()
        if place.isEmpty { emptyTFArray.append(itemTextField) }
        if numberOfPerson == 1 { emptyTFArray.append(numberOfPersonTextField) }
        if amount == 0 { emptyTFArray.append(amountTextField) }
        if !emptyTFArray.isEmpty {
            UIView.animateKeyframes(withDuration: 0.3, delay: 0, animations: {
                emptyTFArray.forEach { TF in
                    TF.attributedPlaceholder = NSAttributedString(string: TF.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                        TF.center.x -= 8
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3, animations: {
                        TF.center.x += 16
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3, animations: {
                        TF.center.x -= 16
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                        TF.center.x += 8
                    })
                }
            }, completion: { _ in
                emptyTFArray.forEach { TF in
                    TF.attributedPlaceholder = NSAttributedString(string: TF.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
                }
            })
            return false
        }
        else { return true }
    }
    
    @objc private func calculateButtonAction(_ sener: UIButton) {
        guard TFemptyAction() else { return }
        let nextVC = ShareViewController()
        
        if !selectedBank.isEmpty && !accountNo.isEmpty && !accountHolder.isEmpty {
            SimpleToss().POSTrequest(bank: selectedBank, account: accountNo, amount: accountHolder) { (result) in
                self.tossLink = "\(result.success.link)"
            }
        }
        // 유저디폴트
        let userArray = userDefault.array(forKey: "itemData") ?? []
        var tempArray = [Any]()
        if !userArray.isEmpty {
            for i in userArray {
                tempArray.append(i)
            }
        }
        let insertData = try? encoder.encode(ItemData(reportingDate: reportingDate, amount: amount, place: place, numberOfPerson: numberOfPerson, accountHolder: accountHolder, selectedBank: selectedBank, accountNumber: accountNo))
        tempArray.append(insertData)
        userDefault.set(tempArray, forKey: "itemData")
        
        nextVC.receiveSubject = place
        nextVC.receiveTotalPrice = amountToString(amount: String(amount))!
        nextVC.receiveTotalPerson = "\(numberOfPerson)"
        nextVC.receiveTotalPriceN = amountToString(amount: String(amount / numberOfPerson))!
        let accountString = accountFlat(selectedBank, accountNo, accountHolder)
        nextVC.receiveDepositAccountLabel = accountFlat(selectedBank, accountNo, accountHolder)
        if accountString.isEmpty {
            nextVC.clipView3.isHidden = true
        } else {
            nextVC.clipView3.isHidden = false
        }
        nextVC.receiveTossUrl = tossLink
        
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func dateTextButtonAction(_ sender: UIButton) {
        let adp = ActionSheetDatePicker(title: "날짜", datePickerMode: .date, selectedDate: Date(), doneBlock: {
            picker, indexes, values in
            let selectDate = indexes as! Date
            let dateString = dateToString(date: selectDate)
            sender.setTitle(dateString, for: .normal)
            self.reportingDate = dateString
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        adp?.setCancelButton(getBarButton("   취소   "))
        adp?.setDoneButton(getBarButton("   선택   "))
        adp?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        adp?.toolbarBackgroundColor = buttonColor
        adp?.show()
        
    }
    
    @objc private func addButtonAction(_ sender: UIButton) {
        numberOfPerson += 1
        numberOfPersonTextField.text = "\(numberOfPerson)"
    }
    
    @objc private func subButtonAction(_ sender: UIButton) {
        if numberOfPerson <= 2 {
            numberOfPersonTextField.text = nil
            numberOfPerson = 1
        } else {
            numberOfPerson -= 1
            numberOfPersonTextField.text = "\(numberOfPerson)"
        }
        
        
    }
}

// MARK: - UI
extension FirstViewController {
    
    private func setUpUI() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        setUpContainerView()
    }
    
    private func setUpContainerView() {
        let safeArea = containerView.safeAreaLayoutGuide
        let UIArray = [
            dateTextButton, itemLabel, itemTextField, amountLabel, amountTextField, personSubStepper,
            personAddStepper, numberOfPersonLabel, numberOfPersonTextField, recentlyUsedAccountButton, accountLabel,
            bankButton, accountTextField, accountHolderTextField, calculateButton
        ]
        UIArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.containerView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            dateTextButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40),
            dateTextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            dateTextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            
            itemLabel.topAnchor.constraint(equalTo: dateTextButton.bottomAnchor, constant: UIMargin),
            itemLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            itemLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            itemTextField.topAnchor.constraint(equalTo: dateTextButton.bottomAnchor, constant: UIMargin),
            itemTextField.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: xMargin),
            itemTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            
            amountLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: UIMargin),
            amountLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            amountLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            amountTextField.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: UIMargin),
            amountTextField.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: xMargin),
            
            numberOfPersonLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: UIMargin),
            numberOfPersonLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            numberOfPersonLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            numberOfPersonTextField.centerYAnchor.constraint(equalTo: numberOfPersonLabel.centerYAnchor),
            numberOfPersonTextField.leadingAnchor.constraint(equalTo: numberOfPersonLabel.trailingAnchor, constant: xMargin),
            numberOfPersonTextField.trailingAnchor.constraint(equalTo: personSubStepper.leadingAnchor),
            
            //            personSubStepper.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: UIMargin),
            personSubStepper.centerYAnchor.constraint(equalTo: numberOfPersonLabel.centerYAnchor),
            personSubStepper.heightAnchor.constraint(equalTo: numberOfPersonTextField.heightAnchor),
            personSubStepper.widthAnchor.constraint(equalTo: personAddStepper.widthAnchor),
            
            personAddStepper.centerYAnchor.constraint(equalTo: numberOfPersonLabel.centerYAnchor),
            personAddStepper.leadingAnchor.constraint(equalTo: personSubStepper.trailingAnchor),
            personAddStepper.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            personAddStepper.heightAnchor.constraint(equalTo: numberOfPersonTextField.heightAnchor),
            
            recentlyUsedAccountButton.topAnchor.constraint(equalTo: numberOfPersonLabel.bottomAnchor, constant: UIMargin),
            recentlyUsedAccountButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            
            recentlyUsedAccountButton.widthAnchor.constraint(equalToConstant: 120),
            
            accountLabel.topAnchor.constraint(equalTo: recentlyUsedAccountButton.bottomAnchor, constant: UIMargin),
            accountLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            accountLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            bankButton.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            bankButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            bankButton.widthAnchor.constraint(equalToConstant: Padding),
            
            accountTextField.centerYAnchor.constraint(equalTo: bankButton.centerYAnchor),
            accountTextField.leadingAnchor.constraint(equalTo: bankButton.trailingAnchor, constant: xMargin),
            accountTextField.widthAnchor.constraint(equalToConstant: 140),
            accountTextField.heightAnchor.constraint(equalTo: bankButton.heightAnchor),
            
            accountHolderTextField.centerYAnchor.constraint(equalTo: bankButton.centerYAnchor),
            accountHolderTextField.leadingAnchor.constraint(equalTo: accountTextField.trailingAnchor),
            accountHolderTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            accountHolderTextField.heightAnchor.constraint(equalTo: bankButton.heightAnchor),
            
            calculateButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -yMargin),
            calculateButton.widthAnchor.constraint(equalToConstant: 100),
            calculateButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}
