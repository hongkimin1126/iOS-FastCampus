//: [Previous](@previous)
/*:
 ---
 # Enumerations
 - 연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능
 ---
 */
//Enumerations
//연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능
enum CompassPoint {
  case north
  case south
  case east
  case west
}

// 열거형 타입의 이름은 Pascal Case
// 각각의 case는 Camel Case
let north = "north"

let south = "south"




enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

var directionToHead1 = CompassPoint.west

directionToHead1 = .east

var directionToHead2: CompassPoint = .north  //이걸로 익히자



/*:
 ## Matching Enumeration Values
 */

let directionToHead: CompassPoint = .south

switch directionToHead {
case .north:
  print("Lots of planets have a north")
case .south:
  print("Watch out for penguins")                       //여기만 인쇄!!!!!
case .east:
  print("Where the sun rises")
case .west:
  print("Where the skies are blue")
}


let enumTypeAnnotation: Planet = .mars
let somePlanet:  Planet = .earth

switch somePlanet {
case .earth:
  print("Mostly harmless")              //이거 출력된다
default:
  print("Not a safe place for humans")
}


/*:
 ---
 ## Associated Values
 ---
 */
print("\n---------- [ Associated Values ] ----------\n")


enum OddOrEven
{
  case odd(Int)
  case even(Int)
}

var number: OddOrEven = .even(20)
number = OddOrEven.odd(13)

number
type(of: number)


switch number
{
case .odd(let  x):  print("홀수 :", x)              //값을 불러오는 방법
case .even(let x): print("짝수 :", x)
}

switch number
{
case let .odd(x): print("홀수 :", x)
case let .even(x): print("짝수 :", x)
}




enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

productBarcode
type(of: productBarcode)


switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
  print("QR code: \(productCode).")
}

/*:
 ---
 ### Question
 - enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현
 ---
 */
// 하단 Answer 참고
enum Month                          // 대문자 꼭서야 된다
{
    case jan
    case feb: ("윤년", "일반")
    
}
/*:
 ---
 ## Raw Value
 - Strings, Characters, or any of the Integer or Floating-point number types
 - raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.
 ---
 */

enum Weekday: Int {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

Weekday.wednesday
Weekday.wednesday.rawValue


enum WeekdayName: String {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

WeekdayName.monday
WeekdayName.monday.rawValue


enum Gender: String {
  case male = "남자", female = "여자", other = "기타"
}

Gender.male
Gender.male.rawValue

/*:
 ---
 ### Question
 - 학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 값 부여
 ---
 */
// 하단 Answer 참고


/*:
 ---
 ### Implicitly Assigned Raw Values
 ---
 */

enum WeekdayAgain: Int {            //일요일을 5로 설정했기때문에 뒤에 이어서 자동으로 설정된다.
  case sunday = 5, monday, tuesday, wednesday, thursday, friday, saturday
//  case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday
//  case sunday = 1, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday
}

WeekdayAgain.sunday
WeekdayAgain.sunday.rawValue

WeekdayAgain.wednesday
WeekdayAgain.wednesday.rawValue



enum WeekdayNameAgain: String {
  case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
}

WeekdayNameAgain.sunday
WeekdayNameAgain.sunday.rawValue        //"sunday"

WeekdayNameAgain.monday
WeekdayNameAgain.monday.rawValue        //"mon" 위에랑 잘 비교해보아라


/*:
 ---
 ### Initializing from a Raw Value
 ---
 */
print("\n---------- [ Initializing from a Raw Value ] ----------\n")

enum PlanetIntRaw: Int {
  case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

PlanetIntRaw(rawValue: 5)       //옵셔널이다 5대신 12 같은거 넣으면 안된다.
PlanetIntRaw(rawValue: 7)

//PlanetIntRaw(rawValue: 0)
//PlanetIntRaw(rawValue: 15)



let positionToFind = 7
//let positionToFind = 11

if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
  switch somePlanet {
  case .earth:
    print("Mostly harmless")
  default:
    print("Not a safe place for humans")
  }
} else {
  print("There isn't a planet at position \(positionToFind)")
}



/*:
 ---
 ## Nested
 ---
 */
print("\n---------- [ Nested ] ----------\n")


enum Device: String {
  case iPhone, iPad, tv, watch
  
  func printType() {
    switch self {                           //???????????self?????????????????????????????????????????
    case .iPad, .iPhone, .tv:
      print("device :", self)
    case .watch:
      print("apple Watch")
    }
  }
}

let iPhone = Device.iPhone
iPhone.printType()




enum Wearable {                     //?????????????????????????????????????????????????????????????
  enum Weight: Int {
    case light = 1
    case heavy = 2
  }
  enum Armor: Int {
    case light = 2
    case heavy = 4
  }
  
  case helmet(weight: Weight, armor: Armor)
  case boots
  
  func info() -> (weight: Int, armor: Int)
   {
    switch self {
    case .helmet(let weight, let armor):
      return (weight: weight.rawValue * 2, armor: armor.rawValue * 5)
    case .boots:
      return (3, 3)
    }
  }
}


Wearable.boots

var woodenHelmet = Wearable.helmet(weight: .light, armor: .heavy)
woodenHelmet.info()



/*:
 ---
 ## Mutating
 - enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 mutating 키워드 필요
 ---
 */

enum Location {
  case seoul, tokyo, london, newyork
  
//  func travelToLondon() {
//    self = .london
//  }
  
  mutating func travelToTokyo() {
    self = .tokyo     //mutating 은 값은 바꿔야 하는데 enum 내부값으로 바꿀때 사용한다.
  }
}

var location = Location.seoul
location

//location.travelToTokyo()
//location


/*:
 ---
 ### Question
 - on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현
 ---
 */
// 하단 Answer 참고


enum botton{
    
    
    
}

/*:
 ---
 ## Recursive Enumerations
 - 자기 자신을 참조하는 Enumeration 형식
 ---
 */
print("\n---------- [ Recursive Enumerations ] ----------\n")           //자주 안쓴다.

//enum ArithmeticExpression {
//  case number(Int)
//  case addition(ArithmeticExpression, ArithmeticExpression)  // 자신의 타입
//  case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//enum ArithmeticExpression {
//  case number(Int)
//  indirect case addition(ArithmeticExpression, ArithmeticExpression)
//  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//indirect enum ArithmeticExpression {
//  case number(Int)
//  case addition(ArithmeticExpression, ArithmeticExpression)
//  case multiplication(ArithmeticExpression, ArithmeticExpression)
//}


//let five = ArithmeticExpression.number(5)
//let four = ArithmeticExpression.number(4)
//let sum = ArithmeticExpression.addition(five, four)
//let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))





/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

// enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현
enum Month {
  case jan, feb(Bool)
}

let february = Month.feb(false)
switch february {
case .jan: break
case .feb(let isLeafYear): print(isLeafYear)
}





// 학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 값 부여
enum Grade: Double {
  case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
}

Grade.A
Grade.A.rawValue




// on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현
enum RemoteControl {
  case on, off
  mutating func toggle() {
    switch self {
    case .on:
      self = .off
    case .off:
      self = .on
    }
  }
}

var remoteControl = RemoteControl.on
remoteControl.toggle()
remoteControl.toggle()


//: [Next](@next)
