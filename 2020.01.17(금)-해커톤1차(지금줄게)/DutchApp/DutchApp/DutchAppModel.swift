//
//  DutchAppDatabase.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/15.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import Foundation

let userDefault = UserDefaults.standard

struct ItemData: Codable {
//  var today: Date
  var reportingDate: String
  var amount: Int
  var place: String
  var numberOfPerson: Int
   
  var accountHolder: String?
  var selectedBank: String?
  var accountNumber: String?
}
