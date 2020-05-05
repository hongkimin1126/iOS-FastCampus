//: [Previous](@previous)
import Foundation
//: # MemoryLeak
//MARK: 여기서부터 듣기
print("\n---------- [ Lazy var closure ] ----------\n")

final class Dog {
  let name: String = "토리"
  
  lazy var bark: () -> () = { [unowned self] in //[unowned self]를 해줘야 강한참조가 안생긴다!!!!
    print(self.name + "가 짖습니다.", terminator: " ")// self는 Dog인데 클로져 내에서 사용중
  } //weak 사용하면 왜 self에 ? 붙는거야???????????????????????????????????????
  deinit { print("이 문장 보이면 메모리릭아님 ->", terminator: " ") }
}

var dog: Dog? = Dog()
//dog?.bark() //이거 주석 해제하고 돌려보면 메모리릭이 발생!!!!!!, Dog는 bark를 가지고 있고,bark도 Dog를 가지고 있어서 서로 하나씩 참조카운트를 올리기때문에 dog = nil로 해도 소멸되지 않는다. ,  lazy var bark에   [unowned self] in //[unowned self]를 해줘야 강한참조가 안생긴다!!!!
dog = nil
print("메모리 릭!\n")

 

print("\n---------- [ weak capture ] ----------\n")

final class Callee {
  deinit { print("🔫🔫 응. 아니야.") }
  var storedProperty: (() -> ())?
  
  func noEscapingFunc(closure: () -> Void) {
//    self.storedProperty = closure    // Compile Error:  노이스케이핑이라서
  }
  func escapingFunc(closure: @escaping () -> Void) { //함수가 바로 종료되는것이 아니라 var storedProperty에 저장되기때문에  @escaping을 붙여야한다. ??
    self.storedProperty = closure
  }
}


final class Caller {
  let callee = Callee() //콜러가 콜리를 가지고 있음
  var name = "James"
  
  func memoryLeak() {
    // 1)
//    callee.escapingFunc { //메모리릭 발생
//      self.name = "Giftbot" //escapingFunc 함수에 self를 넘겨주면 storedProperty에 저장되기때문에 콜리도 콜러를 가지고 있게 된다. 서로 하나씩 가지고 있어서 강한순환참조 발생!!!
//    }
    
    // 2)
//    callee.escapingFunc { [weak self] in //[weak self] 를 붙여서 위에 문제를 해결 하나를 닐처리하면 해제된다.
//      self?.name = "Giftbot"
//    }
  }
  
  func anotherLeak() {
    // 1)
    callee.escapingFunc { //클로져 안에 콜러에 관한 내용이 없다면 캡쳐할게 없어서 아무문제없이 잘 실행된다.
      DispatchQueue.main.async { let _ = 1 + 1 }
    }
    
    // 2)
    callee.escapingFunc {//메모리릭 발생 [weak self] 써줬지만 시점의 문제가 있다!!, ????????????????시점 이해안감ㅠㅠㅠㅠㅠ
      DispatchQueue.main.async { [weak self] in
        self?.name = "Giftbot"
      }
    }

    // 3)
//    callee.escapingFunc { [weak self] in   //위에 시점문제를 해결하기 위해 박에다가 [weak self]넣으니 메모릭이 발생하지 않는다.
//      DispatchQueue.main.async {
//        self?.name = "Giftbot"
//      }
//    }
  }
}

print("버그??? 🐛🐛🐛", terminator: "  ")

var caller: Caller? = Caller()
//caller?.memoryLeak()
caller?.anotherLeak()


DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
  caller = nil
}



//: [Next](@next)
