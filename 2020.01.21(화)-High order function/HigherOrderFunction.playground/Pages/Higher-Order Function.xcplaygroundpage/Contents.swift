//: [Previous](@previous)
/*
 고차함수란?
 - 하나 이상의 함수를 인자로 취하는 함수
 - 함수를 결과로 반환하는 함수
 
 ※ 고차 함수가 되기 위한 조건은 함수가 1급 객체여야 한다.
 */

/*
 1급 객체 (First-class citizen)
 - 변수나 데이터에 할당할 수 있어야 한다.
 - 객체의 인자로 넘길 수 있어야 한다.
 - 객체의 리턴값으로 리턴할 수 있어야 한다.
 */

func firstClassCitizen() {
  print("function call")
}

func function(_ parameter: @escaping ()->()) -> (()->()) {
  return parameter
}

let returnValue = function(firstClassCitizen) // function함수안에 firstClassCitizen함수 넣은거,
returnValue     //함수가 반환되고
returnValue()   //() 괄호 붙이면 함수의 결과가 나온다.print("function call") 가 실행된다.  위에는 이거 실행안되나??

//: [Next](@next)
