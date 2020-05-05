//: [Previous](@previous)
/*:
 # Optionals
 */
/*:
 ---
 ### Question
 - 값이 0인 것과 없는 것의 차이는?  (Empty vs Valueless)
 ---
 */
//  0 <--> optionals   차이점은??

//. optionals은 값이 있을 수도 있고 없을 수도 있다.

















//                                                              왼쪽: 0                       오른쪽: 옵셔널
/*:
 ---
 ## Optional
 * Optional 은 값이 없을 수 있는(absent) 상황에 사용
 * Objective-C 에는 없는 개념
 * 옵셔널 타입은 2가지 가능성을 지님
   - 값을 전혀 가지고 있지 않음
   - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
 ---
 */
//Optional
//Optional 은 값이 없을 수 있는(absent) 상황에 사용
//옵셔널 타입은 2가지 가능성을 지님
//  값을 전혀 가지고 있지 않음
//  값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음


let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)       //Int로 변환하면 있을수도 있고 값이 없을 수도 있다!!!! 예로 123ㄱ 은 닐값이나온다,
type(of: convertedNumber)

//type(of: Int("12ㅍ3"))          //바뀔수도 있고 아닐수도 있어서 옵셔널이다
//type(of: Int(3.14))           //3.14는 숫자라 옵셔널아니다
//type(of: Int(3))              //원래 인트라 옵셔널 아니다.




/*
 Optional Type Declaration
 
 var <#variable name#>: <#Type?#>                                  //보통 이거 많이 사용한다.  (?)
 var <#variable name#>: <#Optional<Type>#>                         //정석
 */

var optionalType1: String?
var optionalType2: Optional<Int>                        //?????????????왜 0 이 있는거야??

type(of: optionalType1)
optionalType2


// Valueless state - nil

var optionalIntInit = Optional<Int>(0)     // ?????
var optionalInt: Int? = 0                   //?????
type(of: optionalInt)

optionalInt = nil                  //nil
optionalInt


// Optional <-> NonOptional
                                                                    //중요한 개념
//var nonOptional1 = nil                                        //타입지정안되서 에러난다!!!!!!!!!111
//var nonOptional2: Int = nil                                   //옵셔널이 아닌데 닐 들어가서 애러!!!!!!!!!!!!
//var nonOptionalType: Int = optionalInt                        //애러난다
    

//optionalInt = 10
//optionalInt = 100
print(optionalInt)


// Optional -> NonOptional (X)
// Optional <- NonOptional (O)

/*:
 ---
 ### Question
 - Optional 헤더 살펴보기
 ---
 */


/*:
 ---
 ## Optional Biding and Forced Unwrapping
 ---
 */

if convertedNumber != nil {
  print("convertedNumber contains some integer value.")
  //  print("convertedNumber has an integer value of \(convertedNumber).")
}

/*:
 ---
 ### Optional Binding
 ---
 */
print("\n---------- [ Optional Binding ] ----------\n")
/*
 if let <#nonOptional#> = <#OptionalExpression#>                  //값이 있을때만 사용하겠다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!중요!!!!!
 {
   <#Code#>
 }
 while let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 guard let <#nonOptional#> = <#OptionalExpression#> else {
   <#Code#>
 }
 */


let nilValue: String? = nil
let someValue = "100"

//10+Int(somevalue) //여기서는 안된다 옵셔널이라 하지만 밑에 if바인딩을 거치면 밑에서는 가능하다.

if let number = Int(someValue) {
  print("\"\(someValue)\" has an integer value of \(number)")           //값이 있으니 이게 실행된다
} else {
  print("Could not be converted to an integer")
}



// Optional Binding - let vs var

var optionalStr: String? = "Hello, Optional"
// let
if let optionalStr = optionalStr {
//  optionalStr += "😍"
  optionalStr
} else {
  "valueless string"
}

// var
if var str = optionalStr {
  str += "😍"
  str
}



// 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
if let firstNumber = Int("4"),let secondNumber = Int("42"),
firstNumber < secondNumber,secondNumber < 100
{
  print("\(firstNumber) < \(secondNumber) < 100")
}

// 위와 동일한 동작. 같은건데 위에 처럼 편하게 할수있다.
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber, secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


/*:
 ---
 ### Forced Unwrapping
 ---
 */
//강제로 벚겨내겠다는 기능이다(!)


/*
 let nonOptional = <#OptionalExpression!#>
 */

print("\n---------- [ Forced Unwrapping ] ----------\n")

if convertedNumber != nil {
//  print("convertedNumber has an integer value of \(convertedNumber).")
  print("convertedNumber has an integer value of \(convertedNumber!).")
}

print(convertedNumber)      //옵셔널 123 나온다
print(convertedNumber!)     //그냥 123 나온다


// Forced unwrap of nil value

convertedNumber = nil
convertedNumber
//convertedNumber!

/*
//앱라이프사이클
not running: 실행되지 않았거나, 시스템에 의해 종료된 상태
inactive: 실핼중이지만 이벤트를 받고있지 않은 상태 실질적으로 이벤트를 못받는 상태
active: 어플리케이션이 실질적으로 활동하고 있는 상태
backround: 백그라운드 상태에서 실질적인 동작을 하고있는 상태
suspended 백그라운드 상태에서 활동을 멈춘상태 메모리가 부족하면 종료시킨다



willfinishlaunchingWithoptions: 어플리케이션 최초호출시에 실행
didfinishlaunching: 어플리케이션이 실행직후ㅠ에 사용자의 화면에 보여지기 직전에 호출
didbecomeactive: 어플리케이션이 active 상태로 전환된 직후 호출
willresignactive: ㅇ어플리케이션이 inactive 상태로 전환된 직후 호출
didenterbackround: 어플리케이션이 백그라윤드 상태로 전환된 직후 호출
willenterforeground: 어플리케이션이 액티브 상태가 되기 직전에, 화면에 보여지기 직전에 호출
willterminate:어플리케이션이 종료 되기 직전에 호출
*/
  
/*:
 ## IUO (Implicitly Unwrapped Optionals)
 */

let possibleString: String? = "An optional string."
//let forcedString: String = possibleString  // Error
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)


var assumedString: String! = "An implicitly unwrapped optional string."         //(!)이 옵셔널은 (?)와 다르게 반드시 값이 있다는 옵셔널이다. 중요!!!!!!!!!!!!!!!!
let implicitString: String = assumedString
let stillOptionalString = assumedString
type(of: assumedString)
type(of: implicitString)
type(of: stillOptionalString)

print(assumedString)
print(assumedString!)

//assumedString = nil
//print(assumedString!)


/*
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
 - 프로퍼티 지연 초기화에 많이 사용
 */


/*:
 ## Nil-coalescing Operator
 */

                                                                //별로 안중요함
print("\n---------- [ Nil-coalescing ] ----------\n")

optionalStr = nil

var result = ""
if optionalStr != nil {
   result = optionalStr!
} else {
   result = "This is a nil value"
}
print(optionalStr)
print(result)


let anotherExpression = optionalStr ?? "This is a nil value"
print(optionalStr)                  //(??) 닐이아니면 가진 값을 넣고 닐이면"This is a nil value"
print(anotherExpression)


let optionalInteger: Int? = 100
let anotherExpression2 = optionalInteger ?? -1                  //닐일때는 -1이고. 아닐떄는 그 값이 나온다.
print(anotherExpression2)


// 어디에 쓰일 수 있을까요?
// Example

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName           //닐일때는 레드가 나오고
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName               //닐이 아니라서 그린이 나온다.
print(colorNameToUse)

/*:
 ---
 ### Question
 - isTrue ? a : b   와의 차이
 - optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
 ---
 */
// (??)는 옵셔널일땨만 사용한다.


//let anotherExpression = optionalStr ?? "This is a nil value"            //(??)
//print(optionalStr)
//print(anotherExpression)


let




/*:
 ## Optional Chaining
 */
//???????????????????????????????????????????????????????????이해못
print("\n---------- [ Optional Chaining ] ----------\n")

let greeting: [String: String] = [
  "John": "Wassup",
  "Jane": "Morning",
  "Edward": "Yo",
  "Tom": "Howdy",
  "James": "Sup"
]

print(greeting["John"])                             //옵셔널       ????
print(greeting["John"]?.count)                      //옵셔널           ????
print(greeting["NoName"])

// Optional Chaining
print(greeting["John"]?.lowercased().uppercased())
print(greeting["Alice"]?.lowercased().uppercased())

// Optional Binding
if let greetingValue = greeting["John"]                 //옵셔널 제거방법
{
  print(greetingValue.lowercased().uppercased())
}

/*:
 ---
 ### Question
 - 아래 두 종류 옵셔널의 차이점이 무엇일까요?
 ---
 */

print("\n---------- [ ] ----------\n")

var optionalArr1: [Int]? = [1,2,3]      //배열 자체카 옵션널
var optionalArr2: [Int?] = [1,2,3]      //배열안에 요소들이 옵셔널이고


var arr1: [Int]? = [1,2,3]
//arr1.append(nil)
//arr1 = nil

//print(arr1?.count)
//print(arr1?[1])


var arr2: [Int?] = [1,2,3]
//arr2.append(nil)  //[1,2'3,nill]
//arr2 = nil        //애러난다

//print(arr2.count)
//print(arr2[1])
//print(arr2.last)


/*:
 ---
 ## Optional Function Types
 ---
 */
print("\n---------- [ Optional Function ] ----------\n")

var aClosure: (() -> Int?)? = {
  return 10
}

type(of: aClosure)
print(aClosure)
print(aClosure?())

aClosure?()
aClosure!()

aClosure = nil
aClosure?()
//aClosure!()



/*:
 ---
 ### Question
 - 아래 내용 참고하여 함수 정의
 ---
 */
/*
 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되
 2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 
 func calculateModulo(op1: Int, op2: Int?) -> Int? {
 }
 */





////다시해보기????????????????
//
func input(a: Int, b: Int?) -> Int?
{
    if let b = b
    {
        return a % b
        
        
    }else
    {
        return nil
        
    }
    
}


input(a: 4, b: 7)













/*:
 ---
 ### Answer
 ---
 */
// OptionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
let answer = optionalStr != nil ? optionalStr! : "This is a nil value"




// 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수
func calculateModulo(op1: Int, op2: Int?) -> Int? {
  guard let op2 = op2, op2 != 0 else { return nil }
  return op1 % op2
}

calculateModulo(op1: 10, op2: 4)
calculateModulo(op1: 39, op2: 5)



//: [Next](@next)
