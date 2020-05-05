//
//  RendererOverlayViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//
//지도위에 내가 원하는 표시를 하는거
//(써클)권한설정 필요해서 델리게이트 -> rendererFor함수 로 해결해야한다.
//별모양도 권한문제 때문에 안되기때문에 밑에 델리리게이트로 권한설정해줌!!!!!!!
import MapKit
import UIKit

final class RendererOverlayViewController: UIViewController {//지도위에 내가 원하는 표시를 하는거
  
  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func addCircle(_ sender: Any) {
    let center = mapView.centerCoordinate //맵뷰의 중앙위치
    let circle = MKCircle(center: center, radius: 40000)
    mapView.addOverlay(circle)
    //이것도 권한문제 때문에 안되기때문에 밑에 델리리게이트로 권한설정해줌!!!!!!!
  }
  
    @IBAction func addStar(_ sender: Any) {//별모양 만들기
        let center = mapView.centerCoordinate
        var point1 = center; point1.latitude += 0.65
        var point2 = center; point2.longitude += 0.4;   point2.latitude -= 0.15
        var point3 = center; point3.longitude -= 0.45;  point3.latitude += 0.4
        var point4 = center; point4.longitude += 0.45;  point4.latitude += 0.4
        var point5 = center; point5.longitude -= 0.4;   point5.latitude -= 0.15
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point5, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
        //별모양도 권한문제 때문에 안되기때문에 밑에 델리리게이트로 권한설정해줌!!!!!!!
    }
  
  @IBAction private func removeOverlays(_ sender: Any) {
    mapView.removeOverlays(mapView.overlays)
  }
}

extension RendererOverlayViewController: MKMapViewDelegate { //위에 권한 설정때문애 했다.
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer { //rendererFor 권한설정 해결하기위한 기능.
        if let circle = overlay as? MKCircle { //서클일때
            let renderer = MKCircleRenderer(circle: circle)
            renderer.strokeColor = UIColor.blue
            return renderer
        }
        if let polyline = overlay as? MKPolyline {//MKPolyline는 내가 그린거 사용할때 여기서는 -> 별!
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.lineWidth = 2  //선 두깨
            renderer.strokeColor = .red
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
