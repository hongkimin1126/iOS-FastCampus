//: [Previous](@previous)
import Foundation

// 키노트 문제 참고
//################ PPT에 문제보고 풀어라!!!!!!!!!!!!   ######################
/*:
 ---
 ## Practice 1
 ---
 */
print("\n---------- [ Practice 1 ] ----------\n")
//################ PPT에 문제보고 풀어라!!!!!!!!!!!!   ######################

struct Pet {
  enum PetType {
    case dog, cat, snake, pig, bird
  }
  var type: PetType
  var age: Int
}

let myPet = [
  Pet(type: .dog, age: 13),
  Pet(type: .dog, age: 2),
  Pet(type: .dog, age: 7),
  Pet(type: .cat, age: 9),
  Pet(type: .snake, age: 4),
  Pet(type: .pig, age: 5),
]

// 1번
func sumDogAge(pets: [Pet]) -> Int {
  return 0
}
sumDogAge(pets: myPet)

// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
  return []
}
oneYearOlder(of: myPet)



/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")
//################ PPT에 문제보고 풀어라!!!!!!!!!!!!   ######################

let immutableArrary = Array(1...40)

func multiplyByIndex(index: Int, number: Int) -> Int {
    
    return index * number
}

//이런시으로 비트써서 짝수 쓸수있다고 한번 보여줬다.
func isEven(number: Int) -> Bool {
    //비트연산 공부하기
    return number & 1 == 0 //&:비트연산자, 홀수는 끝에비트가 1이다. -> 홀수 & 1==> 1 그래서 여기서는 홀수는 무시하겟다는 의미
}

func addTwoNumbers(lhs: Int, rhs: Int) -> Int {
    
    return lhs + rhs
}



var sum = 0
for (index, num) in immutableArrary.enumerated() {
    let multipliesNum = multiplyByIndex(index: index, number: num)
    
    if isEven(number: multipliesNum) {
        sum = addTwoNumbers(lhs: sum, rhs: multipliesNum)
    }
}

//위에풀이를 간단하게
immutableArrary.enumerated().compactMap{ $0 * $1 }.filter { $0.isMultiple(of: 2) }.reduce(0){$0 + $1}



//: [Next](@next)

