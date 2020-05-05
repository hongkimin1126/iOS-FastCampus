//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

//지도에소 터치하면 주소값이랑 위경도값 출력하기
import MapKit
import UIKit
//UITapGestureRecognizer를  스토리보드에 올렸다.
//recognizeTap(위경도) -> reverseGeocode(주소값)
//reverseGeocode(주소값) -> geocodeAddressString(위경도)
final class GeocodeViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {//UITapGestureRecognizer를 스토리보드에 올린거
        let touchPoint = gesture.location(in: gesture.view) //터치포인트 받아서
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView )   //위 터치포인트를 좌표값으로 변환
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude) //위경도값 받아서 reverseGeocode함수에 전달.
        reverseGeocode(location: location)
    }
    
    func reverseGeocode(location: CLLocation) {//지도를 눌렀을때 정보(주소값)를 출력하는거!!!!!
        let geocoder = CLGeocoder() //지오코더 만들기
        
        
        geocoder.reverseGeocodeLocation(location) { placeMark, error in
            print("\n---------- [ 위경도 -> 주소 ] ----------")
            if error != nil {
                return print(error!.localizedDescription)
            }
            
            // 국가별 주소체계에 따라 어떤 속성 값을 가질지 다름.  나라에 따라서 수정해주어야 한다.
            guard let address = placeMark?.first,
                let country = address.country,
                let administrativeArea = address.administrativeArea,
                let locality = address.locality,
                let name = address.name
                else { return }
            
            let addr = "\(country) \(administrativeArea) \(locality) \(name)"
            print(addr)
            
            self.geocodeAddressString(addr)//geocodeAddressString함수에 전달하여 다시 위경도로 바꾸기위해서
        }
    }
    func geocodeAddressString(_ addressString: String) {
        print("\n---------- [ 주소 -> 위경도 ] ----------")
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            print(place)
            
            // 위경도값 출력하기
            print(place.location?.coordinate)
        }
    }
}
