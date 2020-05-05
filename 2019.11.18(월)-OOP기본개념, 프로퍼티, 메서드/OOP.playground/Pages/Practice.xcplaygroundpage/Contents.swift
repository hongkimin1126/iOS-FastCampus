//: [Previous](@previous)

/*
 1. width, height 속성을 가진 Rectangle 클래스 정의
 2. 생성자에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현
 5. 사각형의 넓이를 반환하는 메서드 구현
 6. 다음과 같은 속성을 지닌 인스턴스 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 */

//class Rectangle {
//    var with: Int
//    var height: Int
//
//    init(with: Int,height: Int ) {
//        self.with = with
//        self.height = height
//    }
//
//    func aa1()
//    {
//       print(with * height)
//    }
//    func aa2()
//    {
//        print(with * height)
//    }
//}
//
//
//
//var aaa  = Rectangle(with: 3,height: 3)
//aaa.aa1()
//aaa.aa2()

/*
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현
 3. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
    (직접 프로퍼티에 값을 설정할 수 없다고 가정)
 5. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
 */

class TV
{
    var chanel: Int
    {
        didSet
        {
            if power == false
            {
                chanel = oldValue
            }
        }
        
    }
    

    var volume: Int
    {
           didSet
           {
               if power == false
               {
                   volume = oldValue
               }
           }
           
       }
    
    var power : Bool

    init(chanel: Int, volume: Int, power : Bool )
    {
        self.chanel = chanel
        self.volume = volume
        self.power = power
        
        
    }
    
    func checkvolume()
    {
        if power == true
        {
            return print(chanel, volume)
        }else
        {return print("-1")}
    }
    
    
    
    
}

var ttt = TV(chanel: 2, volume: 2, power: false)
ttt.chanel = 1
print(ttt.chanel)
ttt.chanel

ttt.checkvolume()























//용용
//class TV {
//    var chanel: Int
//    {
//        didSet
//        {
//            if self.power == false
//            {
//                return self.chanel = oldValue
//            }
//        }
//    }
//    var volume: Int
//    {
//        didSet
//        {
//                if self.power == false
//                {
//                    return self.volume = oldValue
//                }
//        }
//    }
//    var power:Bool
//
//    init(chanel: Int, volume: Int, power: Bool){
//            self.chanel = chanel
//            self.volume = volume
//            self.power = power
//        }
//
//    func checkChanelVolume (){
//        if power == true
//        {
//            return print(chanel, volume)
//        } else
//        {
//            return print("-1")
//        }
//    }
//}
//var aaaaa = TV(chanel: 2, volume: 7, power: true)
//aaaaa.chanel = 4
//print(aaaaa.chanel)
//
//aaaaa.checkChanelVolume()





//class TV  거지같은거
//{
//    var channel: Int
//    var volume: Int
//    var power: Bool
//
//    init(channel: Int, volume: Int, power: Bool)
//    {
//        self.channel = channel
//        self.volume = volume
//        self.power = power
//
//    }
//
//
//
//    func aa1()
//    {
//        print(channel)
//        print(volume)
//        print(power)
//
//
//    }
//
//
//
//}
//
//var qqq = TV(channel: 11, volume: 4, power: true)
//qqq.aa1()

/*
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 */

//class Square {
//}
//
//
//class Circle {
//}


//: [Next](@next)
