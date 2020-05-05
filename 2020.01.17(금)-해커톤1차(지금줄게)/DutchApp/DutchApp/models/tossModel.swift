//
//  tossModel.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/16.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import Foundation

struct TossRequest: Codable {
    let apiKey: String
    let bankName: String
    let bankAccountNo: String
    let amount: String
}

// MARK: - Toss
struct Toss: Codable {
    let resultType: String
    let success: Success
}

// MARK: - Success
struct Success: Codable {
    let scheme: String
    let link: String
}
