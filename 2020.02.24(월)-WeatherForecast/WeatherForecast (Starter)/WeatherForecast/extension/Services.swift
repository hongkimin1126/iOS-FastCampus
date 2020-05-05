//
//  Services.swift
//  WeatherForecast
//
//  Created by 신용철 on 2020/02/24.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

// 실제 API 통신용 클래스
final class ForecastService: ForecastServiceType {
    private let baseUrl = "https://api2.sktelecom.com"
    private let appKey = "l7xxc085acf248ff4ae38c2f6eb09f53adc9"
    
    
    func fetchCurrentForecast(
        latitude: Double,
        longitude: Double,
        completionHandler: @escaping (Result<CurrentForecast, ServiceError>) -> Void
        ) {
        var urlComp = URLComponents(string: baseUrl)
        urlComp?.path = "/weather/current/hourly"
        urlComp?.queryItems = [
            URLQueryItem(name: "appKey", value: appKey),
            URLQueryItem(name: "version", value: String(2)),
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
        ]
        guard let url = urlComp?.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return completionHandler(.failure(.clientError)) }
            guard let header = response as? HTTPURLResponse,
                (200..<300) ~= header.statusCode
                else { return completionHandler(.failure(.invalidStatusCode)) }
            guard let data = data else { return completionHandler(.failure(.noData)) }
            
            if let currentForecast = try? CurrentForecast.decode(from: data) {
                completionHandler(.success(currentForecast))
            } else {
                completionHandler(.failure(.invalidFormat))
            }
        }
        
        task.resume()
    }
    
    
    func fetchShortRangeForecast(
        latitude: Double,
        longitude: Double,
        completionHandler: @escaping (Result<[ShortRangeForecast], ServiceError>) -> Void
        ) {
        var urlComp = URLComponents(string: baseUrl)
        urlComp?.path = "/weather/forecast/3days"
        urlComp?.queryItems = [
            URLQueryItem(name: "appKey", value: appKey),
            URLQueryItem(name: "version", value: String(2)),
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
        ]
        guard let url = urlComp?.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return completionHandler(.failure(.clientError)) }
            guard let header = response as? HTTPURLResponse,
                (200..<300) ~= header.statusCode
                else { return completionHandler(.failure(.invalidStatusCode)) }
            guard let data = data else { return completionHandler(.failure(.noData)) }
            
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let weather = json["weather"] as? [String: Any],
                let forecast3days = (weather["forecast3days"] as? [[String: Any]])?.first,
                let fcst3hour = forecast3days["fcst3hour"] as? [String: Any]
                else { return completionHandler(.failure(.invalidFormat)) }
            
            guard let timeRelease = forecast3days["timeRelease"] as? String,
                let sky = fcst3hour["sky"] as? [String: String],
                let temperature = fcst3hour["temperature"] as? [String: String]
                else { return completionHandler(.failure(.invalidFormat)) }
            // 기본 파싱 완료
            
            // 셀에 들어갈 데이터 파싱
            var forecastArr: [ShortRangeForecast] = []
            for hour in stride(from: 4, through: 67, by: 3) {
                guard let skyCode = sky["code\(hour)hour"], !skyCode.isEmpty,
                    let skyName = sky["name\(hour)hour"], !skyName.isEmpty,
                    let tempStr = temperature["temp\(hour)hour"],
                    let temp = Double(tempStr)
                    else { continue }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                guard let releaseTime = dateFormatter.date(from: timeRelease) else { continue }
                let forecastTime = releaseTime.addingTimeInterval(TimeInterval(hour) * 3600)
                
                // skyName(맑음, 흐림 등)은 데이터를 넣기만 하고 셀에서 사용하지 않는 상태
                let forecast = ShortRangeForecast(
                    skyCode: skyCode,
                    skyName: skyName,
                    temperature: temp,
                    date: forecastTime
                )
                forecastArr.append(forecast)
            }
            
            completionHandler(.success(forecastArr))
        }
        
        task.resume()
    }
}

// 샘플 데이터 테스트용 클래스
final class ForecastServiceStub: ForecastServiceType {
    func fetchCurrentForecast(latitude: Double, longitude: Double, completionHandler: @escaping (Result<CurrentForecast, ServiceError>) -> Void) {
        
        let data = SampleData.currentForecast
        let forecast = try! CurrentForecast.decode(from: data)
        completionHandler(.success(forecast))
    }
    
    func fetchShortRangeForecast(latitude: Double, longitude: Double, completionHandler: @escaping (Result<[ShortRangeForecast], ServiceError>) -> Void) {
        
        let data = SampleData.shortRangeForecast
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let weather = json["weather"] as? [String: Any],
            let forecast3days = (weather["forecast3days"] as? [[String: Any]])?.first,
            let fcst3hour = forecast3days["fcst3hour"] as? [String: Any]
            else { return completionHandler(.failure(.invalidFormat)) }
        
        guard let timeRelease = forecast3days["timeRelease"] as? String,
            let sky = fcst3hour["sky"] as? [String: String],
            let temperature = fcst3hour["temperature"] as? [String: String]
            else { return completionHandler(.failure(.invalidFormat)) }
        // 기본 파싱 완료
        
        // 실제 필요한 예보 자료 파싱
        var forecastArr: [ShortRangeForecast] = []
        for hour in stride(from: 4, through: 67, by: 3) {
            guard let skyCode = sky["code\(hour)hour"], !skyCode.isEmpty,
                let skyName = sky["name\(hour)hour"], !skyName.isEmpty,
                let tempStr = temperature["temp\(hour)hour"],
                let temp = Double(tempStr)
                else { continue }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            guard let releaseTime = dateFormatter.date(from: timeRelease) else { continue }
            let forecastTime = releaseTime.addingTimeInterval(TimeInterval(hour) * 3600)
            
            let forecast = ShortRangeForecast(
                skyCode: skyCode, skyName: skyName, temperature: temp, date: forecastTime
            )
            forecastArr.append(forecast)
        }
        completionHandler(.success(forecastArr))
    }
}

protocol ForecastServiceType {
    func fetchCurrentForecast(
        latitude: Double,
        longitude: Double,
        completionHandler: @escaping (Result<CurrentForecast, ServiceError>) -> Void
    )
    
    func fetchShortRangeForecast(
        latitude: Double,
        longitude: Double,
        completionHandler: @escaping (Result<[ShortRangeForecast], ServiceError>) -> Void
    )
}

enum ServiceError: Error {
    case noData
    case clientError
    case invalidStatusCode
    case invalidFormat
}
