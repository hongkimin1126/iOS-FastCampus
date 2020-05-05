//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//


import UIKit
import MobileCoreServices
//  imagePicker.delegate 에서 이미지를 눌렀을때 뭘할지를 결정.
// UIImagePickerControllerDelegate는  UINavigationControllerDelegate까지 같이 받고 있어서 함께 추가해주어야지 애러가 나지 않는다.
//앨범눌렀을때 이미지뷰에 나타나게 하는 작업 -> 델리게이트(didFinishPickingMediaWithInfo 함수)에서 구현
//takePicture 함수에서 카메라 사용할려면 인포피리스트에서 설정해줘야한다. -> 페이지문서보아라
//takePicture 함수에서 동영상 찰영도 사용할려면 비디오 소리를 사용하는 권한문제가 있어서 넘어갈때 앱이 죽는다. 인포피리스트에서 Privacy - Microphone Usage Description 추가해라
//akePicture 함수에서 UTType 사용할련면 ->import MobileCoreServices선언해야한다
//recordingVideo  함수에서 동영상 찰영도 사용할려면 비디오 소리를 사용하는 권한문제가 있어서 넘어갈때 앱이 죽는다. 인포피리스트에서 Privacy - Microphone Usage Description 추가해라
//didFinishPickingMediaWithInfo 함수에서 UIImageWriteToSavedPhotosAlbum 로 사진저장할때 권한문제가 생겨서 인포피리스트에서 Privacy - Photo Library Additions Usage Description 추가
final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private let imagePicker = UIImagePickerController() //UIImagePickerController 만들어라
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self //이미지피커에는 델리게이트가 있다.  이미지를 눌렀을때 뭘할지를 결정.
    }
    @IBAction private func pickImage(_ sender: Any) { //이미지 쓰는거 관련된거(저장방식(연도,월)이나나, 앨범띄우기 같은거)
        
        print("\n---------- [ pickImage ] ----------\n")
        //            imagePicker.sourceType = .savedPhotosAlbum //.photoLibrary(기본상태)이거랑 비교해보기 사실 두달 별차의 없어서 아무가나 써라 -> 사진 보는 방식 연도나 이런거...
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        present(imagePicker, animated: true) // 단순히 앨범만 띄우기
        
    }
    
    @IBAction private func takePicture(_ sender: Any) { //사진을 누르는거????????????이게 뭔소리야 사진에 관련된거야 이함수는??? 아니면 카메라야???
        print("\n---------- [ takePicture ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }    //isSourceTypeAvailable(.camera)은 카메라를 사용할수 있는지를 물어보는것 이거를 안하고 밑에서 바로 사용할려다 안되면 바로 앱이 죽는다.
        imagePicker.sourceType = .camera    //위에서 사용확인되면 카메라를 사용하겟다. 하지만 그래도 앱이 죽는다!!!이유는 권한문제때문이다. 방법은 따로 만들어놓은 페이지 문서보기!!!
        // imagePicker.cameraFlashMode  = .auto //카메라 플레시기
        print(imagePicker.mediaTypes) //미지어타입 출력하면 -> ["public.image"] 나온다 그래서 바로밑에서 미디어타입을 카메라로 변경해준다. 그래야 동영상 촬영도 가능!
        //###########################밑에 3개다 같은거다 근데3개중에 뭐쓰라는 거야?????????????kut타입쓰라고??????
        
        
        //        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)  // ["public.image", "public.movie"] availableMediaTypes를 사용하면 두가지 사용할수있다. "public.movie"가 들어가는 순간 사진만 촬영하는 것이아니라 동영상이나 무비 촬영도 가능해진다. 그런데 비디오 소리를 사용하는 권한문제가 있어서 넘어갈때 앱이 죽는다. 인포에서 해결 ->기본적으로 이거 그냥 사용해라!!!!!
        
        //        imagePicker.mediaTypes = mediaTypes ?? []
        //            imagePicker.mediaTypes = ["public.image", "public.movie"] //바로 밑에랑 같은거다.
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie ] as [String] //kUTType 사용할련면 ->import MobileCoreServices선언해야한다
        
        //######################################################################
        
        present(imagePicker, animated: true)
    }
    
    @IBAction private func takePictureWithDelay(_ sender: Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n") //딜레이 촬영하기
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage as String]   //비디오 안쓸거라 이미지만 지정 -> 의미 없지만 그냥 명시적으로 한듯하다.
        present(imagePicker, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {  //2초 뒤에 찍겠다.
                self.imagePicker.takePicture() // takePicture()는 사진찍는거임 -> 2초뒤에 찍는다 사진을.
            })
        }
    }
    
    @IBAction private func recordingVideo(_ sender: Any) {  //비디오 촬영
        print("\n---------- [ recordingVideo ] ----------\n")
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        // Movie - 영상 + 소리.  Video - 영상만
        imagePicker.mediaTypes = [kUTTypeMovie as String] //kUTTypeMovie능 "public.movie"와 같다 //소리가 필요하기때문에  인포피리스트에서 Privacy - Microphone Usage Description 추가해라
        imagePicker.cameraCaptureMode = .video  //처음에 비디오랑, 무비 둘다 사용가능해서 카메라키면 기본세팅으로 뭘사용할지 명시적으로 세팅함. 사실 안해도 된다.
        //    imagePicker.cameraDevice = .rear  //기본으로 리어라서 주석해도 상관없다
        present(imagePicker, animated: true)
        //    imagePicker.videoQuality = .typeHigh
        
        
        // 동영상 촬영 시작 - 종료
        //    imagePicker.startVideoCapture()
        //    imagePicker.stopVideoCapture()
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) { //Editing변경버튼 누르면 호출
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        imagePicker.allowsEditing.toggle()  //Editing변경버튼(토글버튼) 누르고 앨범버튼누리고 사진선택해서 수정하고 선택누르기
    }
}



// MARK: - UIImagePickerControllerDelegate
// UIImagePickerControllerDelegate는  UINavigationControllerDelegate까지 같이 받고 있어서 함께 추가해주어야지 애러가 나지 않는다.
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    /*
     //imagePickerControllerDidCancel: Cancel(취소)버튼과 관련이 있다. ->cancel 메서드에서 할 작업이 없으면 생략 -> 지금처럼 디스미스만있고 할일이 없으면 생략해도 된다.
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     print("\n---------- [ imagePickerControllerDidCancel ] ----------\n")
     picker.dismiss(animated: true)  //화면 닫아줄려고 구현
     }
     */
    
    //didFinishPickingMediaWithInfo: 앨범에서 이미지가 정해질때(앨범에서 선택하거나 사진을 찍을때) 호출되는 메서드. -> 사진찍은게 여기(didFinishPickingMediaWithInfo)로 들어온다
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\n---------- [ didFinishPickingMediaWithInfo ] ----------\n")   //didFinishPickingMediaWithInfo 정보가 들어있고 이걸 활용!
        
        let mediaType = info[.mediaType] as! NSString //>??????????????????????????????이건 어따쓰냐????? 정체가뭐야??? 왜나왔어??? 필요없나??
        if UTTypeEqual(mediaType, kUTTypeImage) {// 이미지가 들어올때만 밑에로 처리하겠다, 영상일때는 아니다.
            
            //didFinishPickingMediaWithInfo 정보가 들어있고 이걸 활용!
            let originalImage = info[.originalImage] as! UIImage // info를 찍어보면 Any타입이고 originalImage찍어보니 UIImage타입이라서 변경하여 사용하였다.
            let editedImage = info[.editedImage] as? UIImage //editedImage는 allowsEditing이 true일때만 생기는거라 as! 하면 앱이 죽는다. 없을수도 있다.
            let selectedImage = editedImage ?? originalImage //editedImage가있을때는 이걸 저장하고 없으면 originalImage저장
            imageView.image = selectedImage //imageView의 image에 selectedImage를 넣겠다.
            
            if picker.sourceType == .camera {//중복을 해결하기 피커의 소스타입이 카메라일때만 저장되도록한다. 앨범일때는 안된고 카메라로 찍었을때만 추가된다. ???이거 안하면 왜 중복으로 저장되는거야???
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil) //IImageWriteToSavedPhotosAlbum 로 사진저장할때 권한문제가 생겨서 인포피리스트에서 Privacy - Photo Library Additions Usage Description!!! 추가로 또한가지 문제는 사진이 중복저장된다.
            }
        } else if UTTypeEqual(mediaType, kUTTypeMovie) { //무비일경우 저장
            
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path, //mediaURL에서 path정보를 가져온다.
                UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
            }
            
        }
        picker.dismiss(animated: true) //화면 닫아줄려고 구현
    }
}
 
