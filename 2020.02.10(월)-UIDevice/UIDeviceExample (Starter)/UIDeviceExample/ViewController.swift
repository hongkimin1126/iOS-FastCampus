//
//  ViewController.swift
//  UIDeviceExample
//
//  Created by giftbot on 2020/01/28.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

/***************************************************
 UIDevice
 - 디바이스 이름 / 모델 / 화면 방향 등
 - OS 이름 / 버전
 - 인터페이스 형식 (phone, pad, tv 등)
 - 배터리 정보
 - 근접 센서 정보
 - 멀티태스킹 지원 여부
 ***************************************************/


final class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    let device = UIDevice.current
    let notiCenter = NotificationCenter.default
    
    @IBAction private func systemVersion() {//시스템 정보 확인
        print("\n---------- [ System Version ] ----------\n")
        print("System name: ", device.name)//현재 플랫폼이 뭔지에 대한 정보
        
        let systemVersion = device.systemVersion
        print(systemVersion)
        label.text = systemVersion
        
        let splitVersion = systemVersion.split(separator: "0").compactMap{ Int($0)}
        print(splitVersion)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil) //키보드 올라올때
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil) //키보드 내려갈때
    }
    @objc func keyboardWillShowNotification(_ noti: Notification) {
        guard let userInfo = noti.userInfo,
            //keyboardFrameEndUserInfoKey: 키보드의 크기값을 가져온다.
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
            //키보드의 올라오는 시간을 가져와서 이 듀레이션을 애니매이션에 적용할수 있디.
            else { return }
        
    
        UIView.animate(withDuration: duration) { //위의 키보드 듀레이션을 애니매이션시간에 적용.
            //콘텐트
        }
        
    }
    @IBAction private func architecture() { //기기자체를 구분
        print("\n---------- [ Architecture ] ----------\n")
        #if targetEnvironment(simulator) //#if는 어떤환경일때 무엇을 하겠다.
        print("Simulator")
        label.text = "Simulator"
        #else
        print("Device")
        label.text = "Device"
        #endif
        
        //IOS여부 1값이 True
        print("TARGET_OS_IOS", TARGET_OS_IOS) //ios인지 아닌지 1이나오면 TRUE이다.
        print("TARGET_OS_SIMULATOR", TARGET_OS_SIMULATOR) //시뮬레이터인지아닌지
        print("TARGET_CPU_X86", TARGET_CPU_X86) //시뮬레이터32비트 CPU
        print("TARGET_CPU_X86_64", TARGET_CPU_X86_64)//시뮬레이터64비트 CPU
        print("TARGET_CPU_ARM", TARGET_CPU_ARM)//실제기기34비트 CPU
        print("TARGET_CPU_ARM64", TARGET_CPU_ARM64)//실제기기64비트 CPU
    }
    
    @IBAction private func deviceModel() {
        print("\n---------- [ Device Model ] ----------\n")
        print("name: ", device.name) // 내 핸드폰에 설정한이름. 시물레이터면 기기이름
        print("model: ", device.model)
        print("localizedModel: ", device.localizedModel)
        print("userInterfaceIdiom: ", device.userInterfaceIdiom) //폰인지, TV인지, 패드인지
        print("orientation: ", device.orientation) //현재 가로, 세로 방향정보
        print("isMultitaskingSupported: ", device.isMultitaskingSupported)// 멀티태스킹 지원하는 기기인지 확인.
        
        //extenion
        print("isMultitaskingSupported: ", device.identifier)
        print("isMultitaskingSupported: ", device.modelName)
        label.text = "\(device.identifier): \(device.modelName)"
        print("simulatorModelName: ",device.simulatorModelName)
        
        
    }
    
    
    // MARK: - Battery
    
    @IBAction private func battery() {
        print("\n-------------------- [ Battery Info ] --------------------\n")
         
        print("batteryState: ",device.batteryState)// battery 충전중인지, 꽉차있는지 확인.
        print("batteryLevel: ",device.batteryLevel)// battery잔량표시
        
        print("isBatteryMonitoringEnabled: ",device.isBatteryMonitoringEnabled)//모니터링하게되면 소모가 많아지니 필요할때만 사용. 이거 true 상태 아니면 배터리 정보 확인 못한다
        label.text = "\(device.batteryState):\(device.batteryLevel)"
    }
    
    @IBAction private func batteryMonitoring(_ sender: UIButton) {
        print("\n---------- [ batteryMonitoring ] ----------\n")
        sender.isSelected.toggle()
        device.isBatteryMonitoringEnabled.toggle()
        
        if device.isBatteryMonitoringEnabled {
            notiCenter.addObserver(self, selector: #selector(didChangeBatteryState(_:)),
                                   name: UIDevice.batteryStateDidChangeNotification, object: nil)
        } else {//isBatteryMonitoringEnabled가 꺼지면 다시 제거해주는 작업
            notiCenter.removeObserver(self, name: UIDevice.batteryStateDidChangeNotification, object: nil)
        }
    }
    
    @objc func didChangeBatteryState(_ noti: Notification) { //노티피케이션에 디바이스에 대한 정보를 가져온다.
        guard let device = noti.object as? UIDevice else { return }
        print("batteryLevel: ",device.batteryLevel)
        print("batteryState: ",device.batteryState)
    }
    
    
    // MARK: - Proximity State
    
    @IBAction private func proximityMonitoring(_ sender: UIButton) { //근접센서
        print("\n-------------------- [ Proximity Sensor ] --------------------\n")
        
        sender.isSelected.toggle() //isSelected는 버튼 누르면 백그라운드 색들어가면서 활성화됐다고 알수있게 하는기능.
        device.isProximityMonitoringEnabled.toggle() //머니터링 활성화
        print("isProximityMonitoringEnabled: ",device.isProximityMonitoringEnabled)
        
                if device.isProximityMonitoringEnabled {
            notiCenter.addObserver(self, selector: #selector(didChangeProximityState(_:)),
                                   name: UIDevice.proximityStateDidChangeNotification, object: nil)
        } else {
            notiCenter.removeObserver(self, name: UIDevice.proximityStateDidChangeNotification, object: nil)
        }
    }
    
    @objc func didChangeProximityState(_ noti: Notification) {//현제 근접센서가 발동했는지 안했는지
        print(UIDevice.current.proximityState)
        label.text = "\(UIDevice.current.proximityState)"
        

    }
    
    
    // MARK: - Orientation Notification
    
    @IBAction private func beginOrientationNotification() {//방향센서
        device.beginGeneratingDeviceOrientationNotifications() //   노티피는 카운트개념이라서
        print(device.isGeneratingDeviceOrientationNotifications) //방향에 대한 노티가 켜져있는지 확인
        label.text = "\(device.isGeneratingDeviceOrientationNotifications)"
        
        //방향바뀌면 셀렉더가 실행
        notiCenter.addObserver(self, selector: #selector(orientationDidChange(_:)),
        name: UIDevice.orientationDidChangeNotification, object: nil)
        
    }
    
    @objc func orientationDidChange(_ noti: Notification) {
        if let device = noti.object as? UIDevice {
             print("device.orient ation): ",device.orientation)
        }
        
        if #available(iOS 13, *) {//씬사요할때
            let scene = UIApplication.shared.connectedScenes.first
            let orientation = (scene as! UIWindowScene).interfaceOrientation
            print(orientation)
            
        }else { //씬사용하지 않을때
            let orientation = UIApplication.shared.statusBarOrientation
            print("Status Orientation: ",orientation)
            print(orientation.isPortrait)
            print(orientation.isLandscape)
        }
    }
    
    @IBAction private func endOrientationNotification() {// orientation false 시켜서 화면전환 막는다.!!!!!!!!!!!!!!!!!!
        
        while device.isGeneratingDeviceOrientationNotifications { //노티가 카운트처럼 쌓이는 문제를 해결 isGeneratingDeviceOrientationNotifications이 꺼지때 까지 실행!!!!
            device.endGeneratingDeviceOrientationNotifications()
            print("isGeneratingDeviceOrientationNotifications: ",device.isGeneratingDeviceOrientationNotifications)
        }
        notiCenter.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        
        label.text = "\(device.isGeneratingDeviceOrientationNotifications)"
    }
}





