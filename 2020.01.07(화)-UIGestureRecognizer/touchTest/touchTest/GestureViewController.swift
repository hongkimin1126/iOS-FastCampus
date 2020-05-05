import UIKit

class GesutureViewController: UIViewController {
    
    let imgView = UIImageView()
    var tabGesture = UITapGestureRecognizer()
    var swipeGestureRecognizer = UISwipeGestureRecognizer()
    var panGesture = UIPanGestureRecognizer()
    var trueFalse = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imgView)
        imgView.image = UIImage(named: "cat1")
        imgView.layout.centerX().centerY()
        imgView.frame.size = CGSize(width: 150, height: 150)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = imgView.frame.width / 2 //이거 안먹는 이유?? 이거 원안에 터치 되게 할려면 수학적계산 들어가야한다.
        
        tabGesture = UITapGestureRecognizer(target: self, action: #selector(tabGestureRecognizer(_:)))
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureRecognizer(_:)))
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(_:)))
        
        imgView.addGestureRecognizer(tabGesture)
        view.addGestureRecognizer(swipeGestureRecognizer)
        imgView.isUserInteractionEnabled = true // 이미지에 올릴려면 반드시 해줄것!!//*** imageView는 isUserInteractionEnabled 안해주면 addGestureRecognizer 먹통
        imgView.addGestureRecognizer(panGesture)
    }
    
    @objc func tabGestureRecognizer (_ sender: UITapGestureRecognizer){
        //        guard sender.state == .ended else { return }
        print(#function)
        if trueFalse {
            imgView.image = UIImage(named: "cat2")
        } else {
            imgView.image = UIImage(named: "cat1")
        }
        self.trueFalse.toggle()
    }
    
    @objc func swipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) { //sender.direction 기본값은 right 임.
        if sender.direction == .left {
            imgView.image = UIImage(named: "cat2")
            sender.direction = .right //sender.direction = .right해주는 이유는 밑에서 왼쪽으로 바꿔나서 왼쪽만 스와이프되기 때문에 다시 오른쪽 사용할수있게 설정해줌.
        } else {
            imgView.image = UIImage(named: "cat1")
            sender.direction = .left//sender.direction = .left 해주는 이유는 기본 방향이 오른쪽으로 되어있어서 왼쪽 쓰겠다고 설정하는거
         }
        
    }
    
    @objc func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.translation(in: view)
        imgView.center = touchPoint
        
    }
}
