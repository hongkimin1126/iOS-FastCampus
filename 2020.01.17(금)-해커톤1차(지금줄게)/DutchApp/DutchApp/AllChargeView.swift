//
//  AllChargeView.swift
//  DutchApp
//
//  Created by MyMac on 2020/01/15.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import UIKit

class AllChrageView: UIView {
    
    let dateTextField = UITextField()
    let itemLbl = UILabel()
    let amountsLbl = UILabel()
    let playerLbl = UILabel()
    let numOfPlayerLbl = UILabel()
    let itemTextField = UITextField()
    let amountsTextField = UITextField()
    let playerTextField = UITextField()
    let numOfPlayerTextField = UITextField()
    let calculate = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setUI() {
        let UIArray = [dateTextField, itemLbl, amountsLbl, playerLbl, numOfPlayerLbl, itemTextField, amountsTextField, playerTextField, numOfPlayerTextField, calculate]
        UIArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        self.backgroundColor = .lightGray
        itemLbl.text = "항목"
        amountsLbl.text = "금액"
        playerLbl.text = "참여 인원"
        numOfPlayerLbl.text = "몰빵 인원"
        dateTextField.backgroundColor = .white
        itemTextField.backgroundColor = .white
        amountsTextField.backgroundColor = .white
        playerTextField.backgroundColor = .white
        numOfPlayerTextField.backgroundColor = .white
        calculate.setTitle("계산", for: .normal)
        setConstraint()
    }
    
    func setConstraint() {
        let safetyArea = self.safeAreaLayoutGuide
        // MARK: - Labels
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: safetyArea.topAnchor, constant: 60),
            dateTextField.leadingAnchor.constraint(equalTo: safetyArea.leadingAnchor, constant: 20),
            dateTextField.trailingAnchor.constraint(equalTo: safetyArea.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            itemLbl.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 40),
            itemLbl.leadingAnchor.constraint(equalTo: safetyArea.leadingAnchor, constant: 20),
            itemLbl.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            amountsLbl.topAnchor.constraint(equalTo: itemLbl.bottomAnchor, constant: 20),
            amountsLbl.leadingAnchor.constraint(equalTo: safetyArea.leadingAnchor, constant: 20),
            amountsLbl.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            playerLbl.topAnchor.constraint(equalTo: amountsLbl.bottomAnchor, constant: 20),
            playerLbl.leadingAnchor.constraint(equalTo: safetyArea.leadingAnchor, constant: 20),
            playerLbl.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            numOfPlayerLbl.topAnchor.constraint(equalTo: playerLbl.bottomAnchor, constant: 20),
            numOfPlayerLbl.leadingAnchor.constraint(equalTo: safetyArea.leadingAnchor, constant: 20),
            numOfPlayerLbl.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        // MARK: -TextFields
        NSLayoutConstraint.activate([
            itemTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 40),
            itemTextField.leadingAnchor.constraint(equalTo: itemLbl.trailingAnchor, constant: 40),
            itemTextField.trailingAnchor.constraint(equalTo: safetyArea.trailingAnchor, constant: -20),
        ])
        
        
        NSLayoutConstraint.activate([
            amountsTextField.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: 20),
            amountsTextField.leadingAnchor.constraint(equalTo: amountsLbl.trailingAnchor, constant: 40),
            amountsTextField.trailingAnchor.constraint(equalTo: safetyArea.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            playerTextField.topAnchor.constraint(equalTo: amountsTextField.bottomAnchor, constant: 20),
            playerTextField.leadingAnchor.constraint(equalTo: playerLbl.trailingAnchor, constant: 40),
            playerTextField.trailingAnchor.constraint(equalTo: safetyArea.trailingAnchor, constant: -20),
        ])
        
        
        NSLayoutConstraint.activate([
            numOfPlayerTextField.topAnchor.constraint(equalTo: playerTextField.bottomAnchor, constant: 20),
            numOfPlayerTextField.leadingAnchor.constraint(equalTo: numOfPlayerLbl.trailingAnchor, constant: 40),
            numOfPlayerTextField.trailingAnchor.constraint(equalTo: safetyArea.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            calculate.centerXAnchor.constraint(equalTo: safetyArea.centerXAnchor),
            calculate.bottomAnchor.constraint(equalTo: safetyArea.bottomAnchor, constant: -60),
            calculate.widthAnchor.constraint(equalToConstant: 100),
            calculate.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
   
}
