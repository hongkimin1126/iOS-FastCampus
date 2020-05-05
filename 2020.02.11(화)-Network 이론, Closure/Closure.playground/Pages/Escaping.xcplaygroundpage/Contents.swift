//: [Previous](@previous)
import Foundation
/*:
 ---
 # Escaping
 - 함수나 메서드의 파라미터 중 클로져 타입에 @escaping 키워드 적용
 - 해당 파라미터가 함수 종료(return) 이후 시점에도 어딘가에 남아 실행될 수 있음을 나타냄
   - outlives the lifetime of the function
 - 해당 파라미터가 함수 외부에 저장(stored)되거나 async(비동기)로 동작할 때 사용
 - self 키워드 명시 필요
 ---
 */

class Callee {
  deinit { print("Callee has deinitialized") }
  
  func noEscapingFunc(closure: () -> Void) {
    closure()
  }
  func escapingFunc(closure: @escaping () -> Void) { closure() }
}


class Caller {
  deinit { print("Caller has deinitialized") }
  let callee = Callee()
  var name = "James"
  
  func selfKeyword() {
    // self keyword (X)   noescaping
    callee.noEscapingFunc { name = "Giftbot" }
    
    // self keyword  (O) @escaping
    callee.escapingFunc { self.name = "Giftbot" }
  }
  
  
  
  func asyncTask() {
    callee.noEscapingFunc {
      DispatchQueue.main.async {// callee.noEscapingFunc클로져 안에서 DispatchQueue.main.async라는 또다른 클료져에
        self.name = "Giftbot"
      }
    }
    callee.escapingFunc {
      DispatchQueue.main.async {
        self.name = "Giftbot"
      }
    }
  }
  
  
  func captureAsStrong() {
    callee.escapingFunc {
      print("-- delay 2seconds --")
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        self.name = "Giftbot"
      }
    }
  }
  
  func weakBinding() {
//    callee.escapingFunc { [weak self] in //self를 캡쳐 목록에 넣고 weak으로 잡아준다. ??????????????????????이해 잘 안감
//      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//        print("-- after 2seconds with weak self --")
//        self?.name = "Giftbot" //가장 밑에서 caller에 nil을 넣어줬기 때문에  denit이 호출되어서 소멸 되었기 때문에 값을 못넣어준다.
//        print(self?.name ?? "nil")
//      }
//    }

    
    callee.escapingFunc { [weak self] in
      guard let self = self else { return print("Caller no exist") } //MARK: 위에 함수처럼 denit이 호출되어서 소멸되는 것을 방지 하기 위해서 self를 변수에 담아 놓음. [weak self]로 선언하더라도 적어도 아래 코드들은 실행시키기위한 기능.
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("-- after 2seconds with weak self --")
        self.name = "Giftbot"
      }
    }
  }
  
  func unownedBinding() {
    callee.escapingFunc { [unowned self] in //[unowned self] 사라지더라도 주소값은 유지한다.
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("-- after 2seconds with unowned self --")
        print("Oops!!")
        
        self.name = "Giftbot"
        print(self.name)
      }
    }
  }
}


var caller: Caller? = Caller() //이게 뭐야???
caller?.selfKeyword()
//caller?.asyncTask()
//caller?.captureAsStrong()
//caller?.weakBinding()
//caller?.unownedBinding()

print("caller = nil")
caller = nil




//: [Next](@next)
