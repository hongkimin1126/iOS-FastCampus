//: [Previous](@previous)
/*:
 # closure
 - 코드에서 사용하거나 전달할 수 있는 독립적인 기능을 가진 블럭
 - 함수도 클로저의 일종
 */
/*
 //closure
 //코드에서 사용하거나 전달할 수 있는 독립적인 기능을 가진 블럭
 // 함수도 클로저의 일종
 미지원 : Fortran, Pascal, Java 8버전 미만, C++11 버전 미만 등
 지원 : Swift, Objective-C, Python, Java 8 이상, C++11 이상, Javascript 등
 
 언어마다 조금씩 특성이 다름
 다른 프로그래밍 언어의 Lambda(람다 - 익명 함수), Block과 유사
 Lambda ⊃ Closure
 */


/*
 전역(Global) 함수와 중첩(Nested) 함수는 사실 클로저의 특수한 예에 해당.
 클로저는 다음 3가지 중 한 가지 유형을 가짐
 
 - Global functions: 이름을 가지며, 어떤 값도 캡쳐하지 않는 클로저
 - Nested functions: 이름을 가지며, 감싸고 있는 함수의 값을 캡쳐하는 클로저
 - Closure: 주변 문맥(Context)의 값을 캡쳐할 수 있으며, 간단한 문법으로 쓰여진 이름 없는 클로저
 */

//: ## Global functions
print("\n---------- [ Global ] ----------\n")

print(1)
max(1, 2)
func globalFunction() { }


//: ## Nested functions
// 중첩함수
print("\n---------- [ Nested ] ----------\n")

// 캡쳐는 나중에 다시 다룰 내용이므로 가볍게 받아들일 것

func outsideFunction() -> () -> ()      //함수에서 리턴으로 함수를 반환하겠다은의미!!! //입력이 없고 아웃풋이 없다
{
  var x = 0
  func nestedFunction() {
    
    x += 1    // 그 자신의 함수가 가지지 않은 값을 사용
    print(x)
  }
  return nestedFunction
}
let nestedFunction = outsideFunction()  //함스를 변수로 받겠다
nestedFunction()
nestedFunction()
nestedFunction()


//: ## Closure
/*
 Closure Expression Syntax
 
 { <#(parameters)#> -> <#return type#> in
   statements
 }
 */

print("\n---------- [ Basic ] ----------\n")

func aFunction()
{
  print("This is a function.")
}
aFunction()

({
  print("This is a closure.")
})()                             // 1회성 클로져



print("\n---------- [ Save closure to variable ] ----------\n")

// 클로저를 변수에 담아 이름 부여 가능
let closure =
{
  print("This is a closure.")
}
closure()


// 함수도 변수로 저장 가능
var function = aFunction
function()


// 같은 타입일 경우 함수나 클로저 관계없이 치환 가능
function = closure
function()



print("\n---------- [ Closure Syntax ] ----------\n")

// 파라미터 + 반환 타입을 가진 함수
func funcWithParamAndReturnType(_ param: String) -> String {
  return param + "!"
}
print(funcWithParamAndReturnType("function"))



// 파라미터 + 반환 타입을 가진 클로저
// Type Annotation
let closureWithParamAndReturnType1: (String) -> String = { param in
  return param + "!"
}
print(closureWithParamAndReturnType1("closure"))

// Argument Label은 생략. 함수의 Argument Label을 (_)로 생략한 것과 동일


// 파라미터 + 반환 타입을 가진 클로저
let closureWithParamAndReturnType2 = { (param: String) -> String in
  return param + "!"
}
print(closureWithParamAndReturnType2("closure"))


// 파라미터 + 반환 타입을 가진 클로저
// Type Inference
let closureWithParamAndReturnType3 = { param in
  param + "!"            //(!)때문에 변수가 문자열일것이라고 알수 있고 문자열과 더할수있는 것이라서 문자열로 반환값도 알아서 추론!!!!!!
}
print(closureWithParamAndReturnType3("closure"))




/*:
 ---
 ### Question
 - 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현
 - 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
 ---
 */
// 1번 문제 예.   "Swift" -> 5

let Return = {(aaa: String) -> Int in
    return aaa.count}


print(Return("swift"))

// 2번 문제 예.   5 -> 6
let Return2 = {(aaa2: Int) -> Int in
    return aaa2 + 1
}

print(Return2(2))

/*:
 ---
 ### Closure를 쓰는 이유?
 ---
 */
/*
 - 문법 간소화 / 읽기 좋은 코드
 - 지연 생성                                                  ???이해안감
 - 주변 컨텍스트의 값을 캡쳐하여 작업 수행 가능
*/


/*:
 ## Syntax Optimization
 */
/*
 Swift 클로저 문법 최적화
 - 문맥을 통해 매개변수 및 반환 값에 대한 타입 추론
 - 단일 표현식 클로저에서의 반환 키워드 생략
 - 축약 인수명
 - 후행 클로저 문법
 */

print("\n---------- [ Syntax Optimization ] ----------\n")

// 입력된 문자열의 개수를 반환하는 클로저를 함수의 파라미터로 전달하는 예
func performClosure(param: (String) -> Int) {           //함수를 받아서 함수 안에서 실행
  param("Swift")
}

performClosure(param: { (str: String) -> Int in
  return str.count                                  //count 프로퍼티가 인트를 반환하므로 추론가능하여 반환타입 생략가능
})

performClosure(param: { (str: String) in
    return str.count     //count 프로퍼티가 인트를 반환하므로 추론가능
})

performClosure(param: { str in              //?????????????????입력변수는 위에 함수 때문에 생략가능한거야???
  return str.count
})

performClosure(param: {
  return $0.count       //첫번쨰 프로퍼티
})

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count }





/*:
 ## Inline closure
 - 함수의 인수(Argument)로 들어가는 클로저
 */
print("\n---------- [ Inline ] ----------\n")


func closureParamFunction(closure: () -> Void) {
  closure()
}
func printFunction() {
  print("Swift Function!")
}
let printClosure = {
  print("Swift Closure!")
}

closureParamFunction(closure: printFunction)    //미리작성한거 넣는거
closureParamFunction(closure: printClosure)

// 인라인 클로저 - 변수나 함수처럼 중간 매개체 없이 사용되는 클로저
closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})


/*:
 ## Trailing Closure
 - 함수의 괄호가 닫힌 후에도 인수로 취급되는 클로저
 - 함수의 마지막 인수(Argument)에만 사용 가능하고 해당 인수명은 생략
 - 하나의 라인에 다 표현하지 못할 긴 클로져에 유용
 */
print("\n---------- [ Trailing ] ----------\n")

// 후위 또는 후행 클로저
// closureParamFunction { <#code#> }

closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})
closureParamFunction() {
  print("Trailing closure - Implicit closure parameter name")
}
closureParamFunction {
  print("Trailing closure - Implicit closure parameter name")
}



func multiClosureParams(closure1: () -> Void, closure2: () -> Void)     //closure2 마지막에 있는 거라 트레일링 클로져가 된다. 밑에 보면 closure2는 생량가능하다.
{
  closure1()
  closure2()
}

multiClosureParams(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

multiClosureParams(closure1: {
print("inline")
}) {
  print("trailing")
}



/*:
 ---
 ### Question
 - 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
 - 정수를 두 개 입력 받아 곱한 결과를 반환하는 클로져
 ---
 */
let num1 = {(a: Int) -> Bool in
    return a % 2 == 0
    
}
num1(2
)

/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

/// 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현

// 1단계 - 함수로 생각
func stringCount(str: String) -> Int {
  return str.count
}
print(stringCount(str: "Swift"))

// 2단계 - 클로저로 변형
let stringCount = { (str: String) -> Int in
  return str.count
}
stringCount("Swift")

// 3단계 - 문법 최적화
let stringCount2: (String) -> Int = { $0.count }



/// 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
let addOne = { (num: Int) -> Int in
  return num + 1
}
addOne(5)


/// 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
let isEven = { (number: Int) -> Bool in
  return number % 2 == 0
}
// Optimization
let isEven2 = { $0 % 2 == 0 }
isEven(6)
isEven(5)


/// 정수를 두 개 입력받아 곱한 결과를 반환하는 클로져
let multiplyTwoNumbers = { (op1: Int, op2: Int) -> Int in
  return op1 * op2
}
// Optimization
let multiplyTwoNumbers2: (Int, Int) -> Int = { $0 * $1 }        // 1 * 1 = int   1.1 * 1.1 = double 때문에 반환형 인트라고써져야 된다.

multiplyTwoNumbers(20, 5)
multiplyTwoNumbers(5, 10)
multiplyTwoNumbers2(5, 10)




//: [Next](@next)
