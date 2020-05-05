//
//  ServiceManager.swift
//  AlamofireExample
//
//  Created by 양중창 on 2020/02/21.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Alamofire

final class ServiceManager {
    static let shared = ServiceManager()
    
    
    private let baseURL = "https://go.aws/2PcKamh"
    private var reachability = NetworkReachabilityManager(host: "google.com") // 인터넷 상태 체크하는 객체
    
    private init() {
        reachability?.startListening { status in
            switch status {
            case .notReachable: print("notReachable")
            case .reachable(.cellular): print("cellular")
            case .reachable(.ethernetOrWiFi): print("ethernetOrWiFi")
            case .unknown: print("unknown")
            }
        }
    }
    
    func requestUser(completionHandler: @escaping (Result<[User], Error>) -> Void ) {
        AF.request(baseURL)
        .validate() // 200 ... 299 statuscode
        .validate(contentType: ["application/json"])
            .responseDecodable(completionHandler: { (response: DataResponse<[User], AFError>) in
                //메인큐로 돌아온다. UI 작업 가능
                switch response.result {
                case .success(let users):
                    completionHandler(.success(users))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
                
                
            })
    }
    
    
  func requestImage(_ url: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
      AF.request(url)
        .validate()
        .responseData { (response) in
          switch response.result {
          case .success(let data):
            completionHandler(.success(data))
          case .failure(let error):
            completionHandler(.failure(error))
          }
      }
    }
    
}
