  //
//  BasicAnnotationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//
//특정위치에 핀찍어 표시하기!!
  import MapKit
  import UIKit
  //let center = CLLocationCoordinate2DMake(37.566308, 126.977948) 만들고 setRegion함수를 통해서 보여주기
  //addAnnotation 함수로 지도에 핀찍기
  //moveToRandomPin 함수로 랜덤으로 핀 이동
  //removeAnnotation 함수로 전체핀 제거
  //setupCamera 함수로 카메라 보는방식 변경
  final class BasicAnnotationViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let center = CLLocationCoordinate2DMake(37.566308, 126.977948)
        setRegion(coordinate: center)
    }
    
    func setRegion(coordinate: CLLocationCoordinate2D) { //let center = CLLocationCoordinate2DMake(37.566308, 126.977948)를 지도에서 보여주는 기능!
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)//숫자가 클수로 큰범위를 다루고, 작을수록 크게 보인다. //스팬단위는 1도(경도는 약 111k)
        let region = MKCoordinateRegion(center: coordinate, span: span)// 어떤 위치를 보여줄것인가 , 현재의 나의 위치를 센터, 스팬만큼 보여주도록
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction private func addAnnotation(_ sender: Any) {   //지도에다가 핀추가 하는 기능
        let cityHall = MKPointAnnotation() //MKPointAnnotation핀의 정보를 저장하는 개념
        cityHall.title = "시청"
        cityHall.subtitle = "서울특별시" //subtitle은 핀누르면 나온다.
        cityHall.coordinate = CLLocationCoordinate2DMake(37.566308, 126.977948) //취치
        mapView.addAnnotation(cityHall)
        let namsan = MKPointAnnotation()
        namsan.title = "남산"
        namsan.coordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
        mapView.addAnnotation(namsan)
        let gimpoAirport = MKPointAnnotation()
        gimpoAirport.title = "김포공항"
        gimpoAirport.coordinate = CLLocationCoordinate2DMake(37.559670, 126.794320)
        mapView.addAnnotation(gimpoAirport)
        let gangnam = MKPointAnnotation()
        gangnam.title = "강남역"
        gangnam.coordinate = CLLocationCoordinate2DMake(37.498149, 127.027623)
        mapView.addAnnotation(gangnam)
    }
    
    @IBAction private func moveToRandomPin(_ sender: Any) {//랜덤으로 핀 이동
        guard mapView.annotations.isEmpty else {return} //annotation 있을때
        let random = Int.random(in: 0..<mapView.annotations.count) //Int.random 인트형 랜덤 반환 0~3핀중에서 랜덤.
        let annotataion = mapView.annotations[random]
        setRegion(coordinate: annotataion.coordinate)
    }
    
    @IBAction private func removeAnnotation(_ sender: Any) {    //핀제거
         // mapView.removeAnnotation(mapView.annotations)   //전체핀 제거하는 기능//?????????????????????????????????왜 애러나는 거야??  ???????????????????????
    }
    
    var heading = 0.0 //밑에 함수에서 카메라 각도 변경할때 사용.
    @IBAction private func setupCamera(_ sender: Any) {//카메라 보는 방식
        
        let camera = MKMapCamera()
        camera.centerCoordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
        
        camera.altitude = 200//고도(미터 단위)
        camera.pitch = 70.0//카메라 각도(0도 일때 수직으로 내려다 보는 형태)
        heading += 10.0 //이것 때문에 카메라설절버튼 누를 때마다 각이 10도씩 변경된다.
        camera.heading = heading //바라보는 방향 설정하는거
        mapView.setCamera(camera, animated: true)
    }
  }
