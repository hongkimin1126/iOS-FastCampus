//
//  ViewController.swift
//  URL_Session_Starter
//
//  Created by 신용철 on 2020/01/31.
//  Copyright © 2020 신용철. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func syncMethod() {
    print("\n---------- [ syncMethod ] ----------\n")
    let url = URL(string: imageUrlStr)!
    
    // sync(동기) async(비동기)
    // 동기: 호출한 메서드가 종료될 때까지 기다렸다가 다음 작업 수행
    // 비동기: 메서드를 호출만 하고 완료를 기다리지 않고 다음 작업 수행
//    if let data = try? Data(contentsOf: url) {
//        imageView.image = UIImage(data: data)
//    }
//     if let data = try? Data(contentsOf: url) {
//        self.imageView.image = UIImage(data: data)
//    }
    // 동기이지만 비동기처럼 처리하는 방법
    // 데이터 다운로드를 다른스레드에 위임하여 메인스레드에서 작업되지 않도록 해야 렉 안생김.
    // 메인스레드는 다운로드 된 결과물을 ui에 반영하도록 역할 배분해줌.
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                guard let img = UIImage(data: data) else { return}
                self.imageView.image = img
            }
        }
    }
}
  
  
  // MARK: - URLComponents
  
  @IBAction private func urlComponentsExample(_ sender: Any) {
    print("\n---------- [ urlComponentsExample ] ----------\n")
    /***************************************************
     http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag
     ***************************************************/
    
    var components = URLComponents()
    components.scheme = "http"
    print(components)
    components.user = "username"
    print(components)
    components.password = "password"
    print(components)
    components.host = "www.example.com"
    print(components)
    components.port = 80
    print(components)
    components.path = "/index.html"
    print(components)
    components.query = "key1=value1&key2=value2" //쿼리는 ? 다음부터를 의미함
    print(components)
    components.fragment = "frag" // # 다음을 의미함.
    print(components)
    //퀴리가 여러개일 때는 아래와 같이 사용함.
    components.queryItems = [
        URLQueryItem(name: "key1", value: "value1"),
        URLQueryItem(name: "key2", value: "value2")]
    print(components)
    
//    var comp = URLComponents(string: "http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag")
//    comp?.fragment = "myFragment"
//    print(comp)
  }
  
  
  // MARK: - URL Encoding Example
  
  @IBAction private func urlEncodingExample() {
    print("\n---------- [ urlEncodingExample ] ----------\n")
    
    // 영어 주소
    let urlStringE = "https://search.naver.com/search.naver?query=swift"
    if let url = URL(string: urlStringE) {
        print(url)
    } else {
        print("nil")
    }
    
    // 한글 주소
    let urlStringK = "https://search.naver.com/search.naver?query=한글"
    if let url = URL(string: urlStringK) {
        print(url)
    } else {
        print("nil")
    }
    
    // Query 변환
    let str = "https://search.naver.com/search.naver?query=한글"
//    let str = "한글"
    let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let convertedURL = URL(string: queryEncodedStr)!
    print(convertedURL)
    
    let originalString = "color-#708090"
    var allowed = CharacterSet.urlFragmentAllowed
    allowed.insert("#")
    let encodedString = originalString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
    print(encodedString)    // "color-%23708090"
    
    //#color-%23708090 를 color-#708090 로 디코딩하는 방법
    let encodedUrlString = "https://example.com/#color-%23708090"
    let url = URL(string: encodedUrlString)!
    let components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let fragment = components.fragment!
    print(fragment) // "color-#708090"
  }
  
  
  
  // MARK: - Session Configuration
  
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")
    
    _ = URLSession.shared
    _ = URLSessionConfiguration.default
    _ = URLSessionConfiguration.ephemeral
    _ = URLSessionConfiguration.background(withIdentifier: "backgroundID")
    
    let sessionConfig = URLSessionConfiguration.default
    sessionConfig.allowsCellularAccess = false  // 기본값은 true. Wi-fi만 가능하도록 할 때는 false
    sessionConfig.httpMaximumConnectionsPerHost = 5 // 기본값은 4. 한번에 접속 가능한 host의 갯수.
    sessionConfig.timeoutIntervalForRequest = 20    // 기본값은 60초. 서버에서 데이터 받아오는데 걸리는 시간이 이것을 초과하면 다운로드 종료하고 에러메시지 노출시킴.
    sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData    // 기본값은 .useProtocolCachePolicy. 캐시정책을 설정하는 방법.
    sessionConfig.waitsForConnectivity = true   // 기본값은 false. 연결 실패시에 기다렸다가 작업하라는 것. 네트워크 연결관련
    
    // 16 KB (16 * 1024 byte = 16384 byte), 256 MB (256 * 1024 kb * 1024 byte = 268435456 byte)
    // 내가 따로 지정한 캐시를 사용하게 하는 방법
    let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
    sessionConfig.urlCache = myCache
    
//   캐시데이터 저장경로: FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let cache = URLCache.shared
    sessionConfig.urlCache = cache
    print(cache.diskCapacity) //캐시 크기
    print(cache.currentDiskUsage) //사용 중 캐시 크기
    
//    cache.removeAllCachedResponses()    // 캐시 초기화
    
    let mySession = URLSession(configuration: sessionConfig)
    let url = URL(string: imageUrlStr)!
    let task = mySession.dataTask(with: url) { [weak self] (data, response, error) in
        guard let data = data else { return }
        DispatchQueue.main.async {
            self?.imageView.image = UIImage(data: data)!
            print("download completed")
        }
    }
    task.resume()
  }
  

  // MARK: - Get, Post, Delete
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    //서버에서 데이터 가져와서 파싱하기
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    let url = URL(string: todoEndpoint)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription) }
        // client Error
        guard let response = response as? HTTPURLResponse,
            (200..<300).contains(response.statusCode),
            response.mimeType == "application/json" //서버에서 보내주는 타입이 json타입인지 확인
            else { return } // server Error
        guard let data = data else {
            return print("Error: did not receive data")
        }
        guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let todoId = todo["id"] as? Int,
            let todoTitle = todo["title"] as? String
            else { return print("Could not get parsed data") }
        print("ID :", todoId)
        print("Title :", todoTitle)
    }
    task.resume()
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    //서버상의 데이터 변경하고 다시 출력해보기
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    guard let url = URL(string: todoEndpoint) else {
        return print("Error: cannot create URL")
    }
    
    let newTodo: [String: Any] = [
        "userId": 1,
        "title": "My First todo",
        "completed": false,
    ]
    guard let encodedTodo = try? JSONSerialization.data(withJSONObject: newTodo) else { return }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = encodedTodo
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error?.localizedDescription) }
        guard let data = data else { return print("Error: did not receive data") }
        
        guard let receivedTodo = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return print("Could not get parsed data")}
        
        print(receivedTodo)
    }
    task.resume()
  }
  
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    //서버상에 데이터 삭제하기
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    let url = URL(string: todoEndpoint)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode else { return }
        
        
        guard let data = data else { return print("Error: did not receive data")}
        guard let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return print("Could not get parsed data")}
        print(result)
        print(response.statusCode)   // 200 OK
        print("DELETE ok")
    }
    task.resume()
  }
}

