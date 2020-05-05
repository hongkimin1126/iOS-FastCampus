 import Foundation
/*:
 # Capture Example
 */
//MARK: 당장 개발하는데는 필요 없기 때문에 공부자료로 나중에 사용할것!
final class Person: CustomStringConvertible {
  let name: String
  init(name: String) {
    self.name = name
    print("\(self) has entered a chat room")
  }
  var description: String { "\(name)" }
  deinit { print("\(self) has exited!\n") }
}



func withoutBinding() {
  print("\n---------- [ Without Binding ] ----------\n")
  var person = Person(name: "James")
  
  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("- After 2 seconds -")
    print("\(person) is still in a chat room")
    //MARK:함수끝나면 person변수가 죽기때문에 Person(name: "Doppelganger")도 해제 되야 되지만 여기 클로져에서 잡고 있기때문에 여기 클로져가 다끝나고 deinit이 호출된다.
  }
  
  person = Person(name: "Doppelganger")
}

//withoutBinding()


func captureBinding() {
  print("\n---------- [ Binding ] ----------\n")
  var person = Person(name: "James")
  
  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    [doppelganger = person] in //MARK:person이 밑에서 "Doppelganger"로 변경되기 이전에 James인 상태에서 캡쳐한거라 밑에서 Doppelganger로 변경되도 바로 deinit되지 않고 클롲 끝나고 가장 마지막에 해제된다.!!!!
    print("- After 2 seconds -")
    print("\(doppelganger) is still in a chat room")
  }
  person = Person(name: "Doppelganger")
}

//captureBinding()
 

func equivalentToBinding() { //captureBinding 함수랑 같은 방식으로 동작한다.
  print("\n---------- [ Equivalent to Binding ] ----------\n")
  var person = Person(name: "James")
  
  let doppelganger = person
  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("- After 2 seconds -")
    print("\(doppelganger) is still in a chat room")
  }
  person = Person(name: "Doppelganger")
}

equivalentToBinding()



func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  print("\n---------- [ makeIncrementer ] ----------\n")
  var runningTotal = 0
  
  // 함수 형태. 중첩 함수는 클로저의 한 종류
  func incrementerFunc() -> Int { //본인이 가지고 있는 값은 없고 외부에서 가져다 사용하기만 한다. 클로져의 캡쳐 때문에 runningTotal의 마지막값이 계속해서 유지된다.
    runningTotal += amount
    return runningTotal
  }
  
  // 클로저 형태
//  let incrementer: () -> Int = {
//    runningTotal += amount
//    return runningTotal
//  }
  return incrementerFunc //함수 자체르 반환
}


let incrementer = makeIncrementer(forIncrement: 7)
incrementer() //7
incrementer() //14 incrementerFunc함수가 자체 값이 없이 이전 값을 가지고 있는 이유는 클로져라 주변 문맥의 값을 캡쳐하기 때문에 runningTotal의 마지막 값이 계속 유지된다.?????????????????????????????
incrementer() //21


//: [Next](@next)
