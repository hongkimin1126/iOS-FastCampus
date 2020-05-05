//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//
//먼저 권한요청
//델리게이트(권한에 반응하기위해서)
//권한부여 받으면 startUpdatingLocation() 업데이팅
//업데이트 되는 것을 활용하기위해 델리게이트에서 didUpdateLocations 함수 사용!
//mapView.showsUserLocation = true // 움직이고있는 상황을 지도에서 보여주는 기능.
 //내가 이동한 위치에 마크 남기고 싶을때 addAnnotation 함수를 델리게이트에 구현
import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView! //스토리보드에 MKMapView를 올렸다.
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        checkAuthorizationStatus()  //먼저 권한부여부터 해야한다.
        
        mapView.showsUserLocation = true // 움직이고있는 상황을 지도에서 보여주는 기능.
        // mapView.mapType = .satellite //지도 보는 방식을 위성모드로 바꾸는기능
    }
    
    
    func checkAuthorizationStatus() { //권한부여
        switch CLLocationManager.authorizationStatus() {    //현재 권한상태
        case .notDetermined:    //아직 한번도 권한처리 안한경우
            locationManager.requestWhenInUseAuthorization() //권한요청
        //            locationManager.requestAlwaysAuthorization()
        case .restricted, .denied: break    //사용할수없는 경우??????????무시한다고????
        case .authorizedWhenInUse: fallthrough
        case .authorizedAlways:  startUpdatingLocation() //권한 부여받았을때 업데이트 하겠다 함수는 밑에 있다. startUpdatingLocation()
        @unknown default://신경안서도 될듯 자동으로 수정해준다.
            break
        }
    }
    
    func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedWhenInUse || status == .authorizedAlways else {return}   //상태가 둘중에 하나여야 한다
        guard CLLocationManager.locationServicesEnabled() else {return} //현재 로케이션 서비스를 사용할수 있는지 확인.
        
        //밑에두개 주석처리하면 기본값인데 사실 이게 더 정확해서 기본값 사용한다.
        //        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters //위치정확도10미터로 설정
        //        locationManager.distanceFilter = 10.0 //10미터 이동할때마다 갱신하겠다.
        
        locationManager.startUpdatingLocation() //startUpdatingLocation()는 위에 함수랑 다른거다!!!! -> 실제로 위치업데이트하라고 동작시키는 메서드임!!
        //!!!!!여기까지해도 실행안된다 인포리스트에서 뭐해줘야 하는데 문서 파일에 넣어놓음 자세히!!!!
        //인포에 이거 추가 Privacy - Location When In Use Usage Description!!
    }
    
    @IBAction func mornitoringHeading(_ sender: Any) {  //헤딩정보는 뭐야??????????? ?????????????????????????????????????
        guard CLLocationManager.headingAvailable() else {return} //가능한지 체크   헤딩이가능한지???????????이게 뭔소리냐????????
        locationManager.startUpdatingHeading()
    }
    
    @IBAction func stopMornitoring(_ sender: Any) {//??????????????????  stopMornitoring ???????????????????????????????? 바로 위에랑 여기 이해가 안가잖아....
        locationManager.stopUpdatingHeading()//????????????????????????????
    }
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  델리게이트  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
extension MyLocationViewController: CLLocationManagerDelegate {
    //   권한요청 눌렀을때 반응을 하기 위해서 사용
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {//권한상태가 변화되는 것을 체크
        switch status { //   권한요청 눌렀을때 반응을 하기 위해서 사용
        case .authorizedWhenInUse, .authorizedAlways :  //권한이 있는 경우
            print("Authorized") //체크할려고 만듬
        default:    //권한이 없는 경우
            print("Unauthorized")//체크할려고 만듬
        }
    }
    
    //업데이트 되는 것을 활용하기위해 델리게이트에서 didUpdateLocations 함수 사용!  이쪽으로 업데이트 상황 들어온다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //locationManager.startUpdatingLocation() 애서 업데이트 요청한 정보가 들어온다 "didUpdateLocations"
        let current = locations.last! // 이 함수는 반드시 값이 있어야 호출 되는 거라서 !해도 괜찮다. //?????????????
        let coordinate = current.coordinate //좌표값 가져오는거
        
        if(abs(current.timestamp.timeIntervalSinceNow) < 10) { //앱 종료시 다시켤때 오래된 정보는 무시하라고 하능기능  -> 10초 이내에 값만쓰라고 만들었다.
            
            let span = MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)//숫자가 클수로 큰범위를 다루고, 작을수록 크게 보인다. //스팬단위는 1도(경 도는 약 111k)
            let region = MKCoordinateRegion(center: coordinate, span: span)// Region: 어떤 위치를 보여줄것인가! , 현재의 나의 위치를 센터, 스팬만큼 보여주도록
            mapView.setRegion(region, animated: true) //?????이거 뭐하는 거야??? 프리젠트같은거야????????
            
            addAnnotation(location: current) //내가 이동한 위치에 마크 남기고 싶을때
        }
    }
    func addAnnotation(location: CLLocation) { //내가 이동한 위치에 마크 남기고 싶을때
        let annotation = MKPointAnnotation()
        annotation.title = "MyLocation"
        annotation.coordinate = location.coordinate
        mapView.addAnnotation(annotation)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) { //  didUpdateHeading   여기뭐하는 거야???
        print("trueHeading :", newHeading.trueHeading)  //진북(trueHeading) : 변하지 않는 북쪽
        print("magenticHeading :", newHeading.magneticHeading)  //자북(magenticHeading): 나침반에 북쪽을 가리킴 해마다 조금씩 변한다.
        print("values \(newHeading.x), \(newHeading.y), \(newHeading.z),")
    }
}
