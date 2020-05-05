//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2020. 2. 12..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private let imageUrlStr = "https://loremflickr.com/860/640/cat"
    
    
    // MARK: - Sync method
    
    @IBAction private func syncMethod() {
        print("\n---------- [ syncMethod ] ----------\n")
        let url =  URL(string: imageUrlStr)!
        
        //        DispatchQueue.global().async {//Data(contentsOf: url)가 싱크방식이라 어싱크로 바꾼기 위한작업.
        //            if let data = try? Data(contentsOf: url) { //url에 접근해서 데이터를 가져온다. 여기서 문제는 Data(contentsOf: url)이 싱크매서드라서 이게 끝나야 다른 작업이 가능하다.
        //                DispatchQueue.main.async { //UI관련이라서 main에서 처리 , 안하면 앱이 죽는다.!!!!!!
        //                    self.imageView.image = UIImage(data: data)
        //                }
        //            }
        //        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async { //UI관련이라서 main에서 처리 , 안하면 앱이 죽는다.!!!!!!
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume() //task들은 resume()이 붙여줘야 한다.
    }
    
    
    
    
    // MARK: - URLComponents
    
    @IBAction private func urlComponentsExample(_ sender: Any) {
        print("\n---------- [ urlComponentsExample ] ----------\n")
        /*
         http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
         */
        // 위 URL 구성을 보고 URLComponents의 각 파트를 수정해 위 구성과 같도록 만들어보기
        
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
        components.path = "/index.html"    // path는 /로 시작해야 함
        print(components)
        components.query = "key1=value1&key2=value2"
        print(components)
        components.fragment = "myFragment"
        print(components )
        
        
        
    }
    
    
    
    // MARK: - URL Encoding Example
    
    @IBAction private func urlEncodingExample() {
        print("\n---------- [ urlEncodingExample ] ----------\n")
        //영어주소
        let urlStringE = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=swift"
        print(URL(string: urlStringE) ?? "Nil")
        
        //한글주소 - 퍼센트 인코당
        let urlStringK = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=한글" //그냥 이런식으로 한글넣으면 nil값 나온다.
        print(URL(string: urlStringK) ?? "Nil")
        
        //위에 문제를 해결하는 퍼센트 인코딩.
        let str = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=한글"
        let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let convertURL = URL(string: queryEncodedStr)!
        print(convertURL)
        
        //URL -> String
        let encodedString = "https://example.com/#color-%23708090" //%인코딩되어있다. 가져와서 사용할때는 #으로 변경해줘야 한다.
        
        //%인코딩 제거
        print(encodedString.removingPercentEncoding ?? "") //%23인 제거된다
        
        //String -> URL
        let originalString = "color-#708090"
        var allowed = CharacterSet.urlFragmentAllowed
        //allowed.insert("#") //확장????????????????????
        
        let encodedString2 = originalString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        print(encodedString2)
    }
    
    
    
    
    // MARK: - Session Configuration
    
    @IBAction private func sessionConfig(_ sender: Any) {
        print("\n---------- [ Session Configuration ] ----------\n")
        _ = URLSessionConfiguration.default    //기본가뵤
        _ = URLSessionConfiguration.ephemeral //캐시없이 사용
        _ = URLSessionConfiguration.background(withIdentifier: "kr.gitbot.example.backgroundConfig") //백그라운드 작업시 사용
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.allowsCellularAccess = false //기본깂은 true -> false는 와이파이만 사용하겠다는 것
        sessionConfig.httpMaximumConnectionsPerHost = 5 //호스트당 최대 몇개까지 사용할수있는지 설정 기본값은4
        sessionConfig.timeoutIntervalForRequest = 20 //요청할때 최대 몇초까지 타임아웃 지정하는 기능 기본값은 1분
        sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData //로컬캐시데이터 무시하고 항상 원본에 접근 기본값은 .useProtocolCachePolicy
        sessionConfig.waitsForConnectivity = true //네트워크가 불안정할때 연결시도해보구 실패했을때 바로 실패했을때 알려줄지 아니면 좀 기다릴지를 정한다 false면 바로 실패 알려주고 true면 좀 기다린다.
        
        //기본캐시 URLCache.shared
        //메모리 - 16KB(16 * 1024 = 26384)
        //디스크 - 256MB(256 * 1024 * 1024 = 268_435_456)
        let mycache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
        sessionConfig.urlCache = mycache //내가 만든 캐시
        
        let cache = URLCache.shared
        sessionConfig.urlCache = cache //기본캐시
        
        print(cache.diskCapacity) //500kb 나와야되는데 나는 이상하낟?????????????????????
        print(cache.currentMemoryUsage) //0
        print(cache.diskCapacity)  //약 9.5mb
        print(cache.currentDiskUsage) //얼마나 사용중인지  //?????????????강의랑 값이 다르다?????????
        
        cache.removeAllCachedResponses() //저장된 캐시삭제
        
        let mySession = URLSession(configuration: sessionConfig)
        let url = URL(string: imageUrlStr)!
        let task = mySession.dataTask(with: url) { [weak self](data, response, error) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)!
                print("download completed")
            }
        }
        task.resume()
    }
    
    
    
    // MARK: - Get, Post, Delete
    
    // https://jsonplaceholder.typicode.com/
    
    @IBAction func requestGet(_ sender: Any) {
        print("\n---------- [ Get Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: todoEndpoint) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {return print(error?.localizedDescription)}
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode),
                response.mimeType == "applition/json" //mimeType: 어떤형태의 데이터가 들어오는지.
                else {return}
            guard let data = data else {return print("No Data")}
            
            guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let todoID = todo["id"] as? Int,
                let todoTitle = todo["title"] as? String else{return print("Could not get parsed data")}
            
            
            
            print("ID:", todoID)
            print("Title:", todoTitle)
            
        }
        task.resume()
        
    }
    
    //MARK: 딕셔너리 -> Data
    @IBAction func requestPost(_ sender: Any) {
        print("\n---------- [ Post Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
        guard let todoURL = URL(string: todoEndpoint) else {return}
        
        let newTodo: [String: Any] = ["title": "My Todo", "userID": "20"]
        guard let jsonTodo = try? JSONSerialization.data(withJSONObject: newTodo) else { return } //딕셔너리 -> Data
        
        var urlRequest = URLRequest(url: todoURL)
        urlRequest.httpMethod = "POST" //httpMethod를 POST로 변경해야 한다.
        urlRequest.httpBody = jsonTodo //httpBody에 원하는 값넣는다.   //근데 이게 뭔말이야 원하는거 넣으라고???????????????
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error)  in
            guard let data = data, let newItem = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            print(newItem)
            if let id = newItem["id"] as? Int {
                print(id)
            }
        }
        task.resume()
    }
    
    @IBAction func requestDelete(_ sender: Any) {
        print("\n---------- [ Delete Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
        
        let url = URL(string: todoEndpoint)!
        var urlRequest = URLRequest(url: url) //URLRequest를 통해서 url지정하고
        urlRequest.httpMethod = "DELETE" //httpMethod를 바꿔야한다
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error)  in
            guard error == nil else { return print(error?.localizedDescription) }
            guard let data = data else { return print("No Data") }
            print("DELETE ok")
            
            if let res = response as? HTTPURLResponse { print(res.statusCode) }
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(data) //2bytes
                print(jsonObject) // [:]
            }
            
        }
        task.resume()
    }
    
}
