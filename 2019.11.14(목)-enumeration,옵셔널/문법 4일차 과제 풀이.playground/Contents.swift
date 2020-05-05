
import Foundation


/*
 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
 */

// Optional Binding을 이용한 방식

func combineString1(str1: String?, str2: String?, str3: String?) -> String
{
  var combinedString = ""
  if let unwrappedString = str1
  {
    combinedString += unwrappedString
  }
  if let unwrappedString = str2
  {
    combinedString += unwrappedString
  }
  if let unwrappedString = str3
  {
    combinedString += unwrappedString
  }
  return combinedString
}







//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*
 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
 enum Arithmetic {
   case addition, subtraction, multiplication, division
 }
 func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
   // 코드
 }
 */


enum Arithmetic
{
  case addition, subtraction, multiplication, division
}

func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int
{
  switch op
  {
  case .addition:
    return operand1 + operand2
  case .subtraction:
    return operand1 - operand2
  case .multiplication:
    return operand1 * operand2
  case .division:
    return Int(operand1 / operand2)
  }
}

print(calculator(operand1: 15, operand2: 25, op: .addition))
print(calculator(operand1: 30, operand2: 10, op: .subtraction))
print(calculator(operand1: 12, operand2: 10, op: .multiplication))
print(calculator(operand1: 24, operand2: 6, op: .division))







