//: [Previous](@previous)
/*:
 # Class
 */
/*
 Value Type => struct, enum  (Stack 에 저장)       //처음부터 지정된상태로 들어갈때 스택
 Reference Type => class  (Heap 에 저장)//레퍼런스 타입은 힙에 저장한다.        //동적할당시 힙.
 */
//메모리 - 코드, 데이터, 스택, 힙

/*
 let x = 5      //struck라서 스택에 저장된다.
 let y = User()
 let z = User()
 
         x   y        z
 [Stack] | 5 | 0x5F17 | 0x2C90 |
 
        0x2C90          0x5F16     0x5F17
 [Heap] | z's user data | SomeData | y's user data |
 
 --- in Memory ---
 값 타입(Value Type) - Stack
 참조 타입(Reference Type) - Stack -> Heap
 */


/*
 class <#ClassName#> {
   <#PropertyList#>
   <#MethodList#>
 }
 
 class <#ClassName#>: <#SuperClassName#>, <#ProtocolName...#>.   //기본형태
 {
   <#PropertyList#>
   <#MethodList#>
 }
 
 let <#objectName#> = <#ClassName()#>
 objectName.<#propertyName#>
 objectName.<#functionName()#>
 */


class Dog
{
  var color = "White"
  var eyeColor = "Black"
  var height = 30.0
  var weight = 6.0
  
  func sit() {
    print("sit")
  }
  func layDown() {
    print("layDown")
  }
  func shake() {
    print("shake")
  }
}


let bobby: Dog = Dog()
bobby.color
bobby.color = "Gray"
bobby.color
bobby.sit()

let tory = Dog()
tory.color = "Brown"
tory.layDown()


/*:
 ---
 ### Question
 - 자동차 클래스 정의 및 객체 생성하기
 ---
 */
/*
 자동차 클래스
 - 속성: 차종(model), 연식(model year), 색상(color) 등
 - 기능: 운전하기(drive), 후진하기(reverse) 등
 */


class Car1
{
    var model: String
    var year: String
    var color: String
    
    
    init(model:String, year: String, color: String)
    {
        self.model = model
        self.year = year
        self.color = color
    }
    
    func drive() {
        print("전진")
    }
    
    func reverse() {
        print("전진")
    }
}



var aaa = Car1(model: "bm", year: "1223", color: "blue")
aaa.drive()
/*:
 ---
 ### Answer
 ---
 */
class Car {
  let model = "Palisade"
  let modelYear = 2019
  let color = "Cream White"
  
  func drive() {
    print("전진")
  }
  func reverse() {
    print("후진")
  }
}

let car = Car()
car.drive()
car.reverse()



//: [Next](@next)
