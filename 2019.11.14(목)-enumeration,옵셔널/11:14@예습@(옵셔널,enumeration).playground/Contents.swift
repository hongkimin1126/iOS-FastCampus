import Cocoa

//******************************옵셔녈**********************************
//값이 있을 수도, 없을 수도 있음을 표현
//nil이 할당 될 수 있는지 없는지 표현

// someOptionalParm에 nil이 할당 될 수 있다.
func someFunction(someOptionalParam: Int?)          //옵셔널 nill들어올수있다
{
       // ....
}

/// someOptionalParm에 nil이 할당 될 수 없다.
func someFunction(someOptionalParam: Int)           //옵셔널 아니라서  nill은 들어올수 없다!!!
{
       // ....
}

someFunction(someOptionalParam: nil)
// someFunction(someParam: nil)

            

//         옵셔널을 쓰는 이유
//          명시적 표현
//          1. nil의 가능성을 코드만으로 표현가능
//          2. 문서/주석 작성 시간 절약
//          안전한 사용
//          1. 전달받은 값이 옵셔널이 아니라면 nil 체크를 하지 않고 사용가능
//          2. 예외 상황을 최소화 하는 안전한 코딩
//          3. 효율적 코딩
            
//          옵셔널 문법과 선언
//            옵셔널 문법 = enum + general (수업 후반에 다시 배울거에요)
//            옵셔널 선언
//enum Optional<Wrapped>: ExpressibleByNiliteral {
//         case none
//         case some(Wrapped)
//}
//
//let optionalValue: Optional<Int> = nil
//let optionalValue: Int? =nil

//
//            옵셔널 표현
//            1. 느낌표(!)를 이용한 암시적 추출 옵셔널

// Implicitly Unwrapped Optional
var implicitlyUnwrappedOptionalValue: Int! = 100            //Int! 암시적 추출

switch implicitlyUnwrappedOptionalValue {
case .none:                                                 //열거형  none:값이 없다   some:값이 있다.
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

//           2. 물음표(?)를 이용한 옵셔널

// Optional
var optionalValue: Int? = 100

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1





//                    ***************************옵셔널추출***************************
//                    1. 옵셔널 추출이란?
//                    2. 옵셔널 방식
//                     옵셔널 바인딩
//                     1. nil 체크 + 안전한 추출
//                     2. 옵셔널 안에 값이 들어있는지 확인하고 값이 있으면 값을 꺼내옵니다.
//                     3. if-let 방식 사용

//func printName(_ name: String) {
//    print(name)
//}
//
//var myName: String? = nil
//
////printName(myName)
//// 전달되는 값의 타입이 다르기 때문에 컴파일 오류발생
//
//if let name: String = myName {
//    printName(name)
//} else {
//    print("myName == nil")
//}
//
//
//var yourName: String! = nil
//
//if let name: String = yourName {
//    printName(name)
//} else {
//    print("yourName == nil")
//}
//
//// name 상수는 if-let 구문 내에서만 사용가능합니다
//// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
////printName(name)
//
//
//// ,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있습니다
//// 모든 옵셔널에 값이 있을 때만 동작합니다
//myName = "yagom"
//yourName = nil
//
//if let name = myName, let friend = yourName {
//    print("\(name) and \(friend)")
//}
//// yourName이 nil이기 때문에 실행되지 않습니다
//yourName = "hana"
//
//if let name = myName, let friend = yourName {
//    print("\(name) and \(friend)")
//}
//// yagom and hana


                    //강체추출 : 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식, 만약 값이 없을경우(nil) 런타임 오류가 발생하기 때문에 추천되지 않습니다.

//var myName: String? = yagom
//var youName: String! = nil
//
//
//printName(myName!) // yagom
//myName = nil
//
////print(myName!)
//// 강제추출시 값이 없으므로 런타임 오류 발생
//yourName = nil
//
////printName(yourName)
//// nil 값이 전달되기 때문에 런타임 오류발생



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                            열거형
//Swift 열거형은 다른 언어의 열거형과 많이 다릅니다. 강력한 기능을 지니고 있어 잘 알아두고 사용하면 좋습니다.
//유사한 종류의 여러 값을 한 곳에 모아서 정의한 것입니다. 예) 요일, 월, 계절 등
//enum 자체가 하나의 데이터 타입으로, 대문자 카멜케이스를 사용하여 이름을 정의합니다.
//각 case는 소문자 카멜케이스로 정의합니다.
//각 case는 그 자체가 고유의 값입니다.(각 case에 자동으로 정수값이 할당되지 않음)
//각 case는 한 줄에 개별로도, 한 줄에 여러개도 정의할 수 있습니다.


//enum 이름 {
//    case 이름1
//    case 이름2
//    case 이름3, 이름4, 이름5
//    // ...
//}
//
//// 예제
//enum BoostCamp {
//        case iosCamp
//        case androidCamp
//        case webCamp
//}



//2. 열거형 사용
//타입이 명확할 경우, 열거형의 이름을 생략 할 수 있습니다.
//switch 구문에서 사용하면 좋습니다.


enum Weekday {
    case mon
    case tue                          //하나나씩도 되고
    case wed
    case thu, fri, sat, sun           //여러개도 가능
}
//
//// 열거형 타입과 케이스를 모두 사용하여도 됩니다
var day: Weekday = Weekday.mon
//
//// 타입이 명확하다면 .케이스 처럼 표현해도 무방합니다
//day = .tue
//
//print(day) // tue
//
//// switch의 비교값에 열거형 타입이 위치할 때
//// 모든 열거형 케이스를 포함한다면
//// default를 작성할 필요가 없습니다
switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}


//3. rawValue (원시값)
//C 언어의 enum 처럼 정수값을 가질 수 있습니다.
//rawValue는 case별로 각각 다른 값을 가져야합니다.
//자동으로 1이 증가된 값이 할당됩니다.
//rawValue를 반드시 지닐 필요가 없다면 굳이 만들지 않아도 됩니다.


//enum Fruit: Int {
//    case apple = 0
//    case grape = 1
//    case peach
//
//    // mango와 apple의 원시값이 같으므로
//    // mango 케이스의 원시값을 0으로 정의할 수 없습니다
////    case mango = 0
//}
//
//print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
//// Fruit.peach.rawValue == 2


//정수 타입 뿐만 아니라, Hashable 프로토콜을 따르는 모든 타입을 원시값의 타입으로 지정 할 수있습니다.

//enum School: String {
//    case elementary = "초등"
//    case middle = "중등"
//    case high = "고등"
//    case university
//}
//
//print("School.middle.rawValue == \(School.middle.rawValue)")
//// School.middle.rawValue == 중등
//
//// 열거형의 원시값 타입이 String일 때, 원시값이 지정되지 않았다면
//// case의 이름을 원시값으로 사용합니다
//print("School.university.rawValue == \(School.university.rawValue)")
//// School.middle.rawValue == university


//4. 원시값을 통한 초기화
//rawValue를 통해 초기화 할 수 있습니다.
//rawValue가 case에 해당하지 않을 수 있으므로, rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입입니다.


//// rawValue를 통해 초기화 한 열거형 값은 옵셔널 타입이므로 Fruit 타입이 아닙니다
////let apple: Fruit = Fruit(rawValue: 0)
//let apple: Fruit? = Fruit(rawValue: 0)
//
//// if let 구문을 사용하면 rawValue에 해당하는 케이스를 곧바로 사용할 수 있습니다
//if let orange: Fruit = Fruit(rawValue: 5) {
//    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
//} else {
//    print("rawValue 5에 해당하는 케이스가 없습니다")
//} // rawValue 5에 해당하는 케이스가 없습니다


//5. 메서드
//Swift의 열거형에는 메서드도 추가할 수 있습니다.


//enum Month {
//    case dec, jan, feb
//    case mar, apr, may
//    case jun, jul, aug
//    case sep, oct, nov
//
//    func printMessage() {
//        switch self {
//        case .mar, .apr, .may:
//            print("따스한 봄~")
//        case .jun, .jul, .aug:
//            print("여름 더워요~")
//        case .sep, .oct, .nov:
//            print("가을은 독서의 계절!")
//        case .dec, .jan, .feb:
//            print("추운 겨울입니다")
//        }
//    }
//}
//
//Month.mar.printMessage()
