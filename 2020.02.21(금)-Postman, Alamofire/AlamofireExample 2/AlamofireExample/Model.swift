//
//  Model.swift
//  AlamofireExample
//
//  Created by 양중창 on 2020/02/21.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation


let jsonData =
"""
{
  "name": "Alina",
  "surname": "Grecescu",
  "gender": "female",
  "region": "Romania",
  "age": 34,
  "title": "ms",
  "phone": "(748) 937 8858",
  "birthday": {
    "dmy": "07/09/1986",
    "mdy": "09/07/1986",
    "raw": 526451656
  },
  "email": "alina_86@example.com",
  "password": "Grecescu86&^",
  "credit_card": {
    "expiration": "3/25",
    "number": "5745-8712-3746-6978",
    "pin": 4405,
    "security": 183
  },
  "photo": "https://uinames.com/api/photos/female/16.jpg"
}
""".data(using: .utf8)!



struct CreditCard: Decodable {
  let expiration: String
  let number: String
  let pin: Int
  let security: Int
}

struct User: Decodable {
  let fullName: String
  let phone: String
  let birthDay: Date
  let email: String
  let creditCard: CreditCard
  let photo: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case surname
        case phone
        case birthday
        case email
        case creditCard = "credit_card"
        case photo
    }
    
//    private enum NameKey: String, CodingKey {
//
//    }
    
    private enum BirthDayKey: String, CodingKey {
        case raw
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try values.decode(String.self, forKey: .name)
        let surName = try values.decode(String.self, forKey: .surname)
        self.fullName = name + " " + surName
        
        self.phone = try values.decode(String.self, forKey: .phone)
        self.email = try values.decode(String.self, forKey: .email)
        self.creditCard = try values.decode(CreditCard.self, forKey: .creditCard)
        self.photo = try values.decode(String.self, forKey: .photo)
        let birthDayKey = try values.nestedContainer(keyedBy: BirthDayKey.self, forKey: .birthday)
        let birthDayRowData = try birthDayKey.decode(Double.self, forKey: .raw)
        self.birthDay = Date(timeIntervalSince1970: birthDayRowData)
        
    }
    
}


