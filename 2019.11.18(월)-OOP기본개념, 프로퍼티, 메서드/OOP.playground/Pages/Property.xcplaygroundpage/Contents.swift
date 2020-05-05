//: [Previous](@previous)
import Foundation
/*:
 # Property
 */
/*:
 ---
 ## Stored Property
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
class StoredProperty
{
  var width = 0.0
  var height = 0.0
}

let stored = StoredProperty()
stored.width = 123
stored.height = 456
stored.width
stored.height

/*:
 ---
 ## Lazy Stored Property
 - 초기값이 인스턴스의 생성이 완료 될 때까지도 알 수 없는 외부 요인에 의존 할 때
 - 초기값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
 - 필요한 경우가 제한적일 때
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
print("\n---------- [ Lazy Property ] ----------\n")

class BasicStoredProperty {
  var width = 10.0
  var height = 20.0
  
  var area = 200.0
//  var area = self.width * self.height
}

let basicStored = BasicStoredProperty()
basicStored.area
basicStored.width = 30
basicStored.area
basicStored.width


class LazyStoredProperty {
  var width = 10.0
  var height = 20.0
  
  // 1. 외부 요인이나 다른 설정에 기반
//  var area = self.width * self.height
  lazy var area = width * height
  
  // 2. 계산 비용이 많이 드는 상황
//  var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
  
  // 3. 필요한 경우가 제한적인 상황
//  func ifStatement() {
//    if true {   // 10%
//      print(area)
//    } else {    // 90%
//      print(width)
//    }
//  }
}

let lazyStored = LazyStoredProperty()
lazyStored.width = 30
lazyStored.area


// 순서 주의
let lazyStored1 = LazyStoredProperty()
lazyStored1.area
lazyStored1.width = 30
lazyStored1.area        //최초 호출되는 시점에 초기화라서 이미 200으로 값이 있기 때문에 그대로 간다. with에 30을 넣기 전에 초기화를 한것이다.


/*:
 ---
 ## Computed Property
 - 자료를 저장하지 않고 매번 호출할 때마다 새로 계산
 - Class ⭕️   Structure ⭕️   Enumeration ⭕️
 ---
 */
/*
  var <#variable name#>: <#type#>
 {
      get {
          <#statements#>
      }
      set {
          <#variable name#> = newValue
      }
  }
 */


print("\n---------- [ Computed Property ] ----------\n")

class ComputedProperty {
  var width = 5.0
  var height = 5.0
  
  lazy var lazyArea = width * height
  var area: Double {             //연산 프로퍼티
    return width * height       //읽기 전용은 get 생략가능
  }
  
  // Stored + Computed get(read), set(write)
  private var _koreanWon = 0.0      //연산 프로퍼티는 값을 저장할수 없어서 이렇게 저장프로퍼티를 이용해서 저장한다
  var wonToDollar: Double {
    get {//클래스 내부 프로퍼티  값들로 인해 계산하여 반영
      return _koreanWon / 1136.5
    }
    set {//외부에서 변경가능하도록 하기 위해
    _koreanWon = newValue
        //set에 새로 들어오는값 newValue
    
    }
  }
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
var computed = ComputedProperty()
computed.area
computed.lazyArea

computed.width = 10
computed.area           //즉시 연산한것라  50이 나온다.
computed.lazyArea       //얘는 직접변경해야 되서 25이고 값이

computed.lazyArea = 50.0
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area
computed.lazyArea

computed.wonToDollar
computed.wonToDollar = 10000
computed.wonToDollar


/*:
 ---
 ## Property Observer
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
/*
 var <#variable name#>: <#type#> = <#value#>
 {
     willSet {   //변수값이 변경전에 호출
     }
     didSet {    //변수값이 변경후에 호출
         <#statements#>
     }
 }
 */

print("\n---------- [ Property Observer ] ----------\n")

class PropertyObserver {
  var height = 0.0
  
  var width = 0.0 {
    willSet {
        print("willSet :", width, "->", newValue) //with  = 0.0 newValue = 123.0
    }
    didSet {
      print("didSet :", oldValue, "->", width)  //oldValue =0.0 with = 123.0
      height = width / 2
    }
  }
}

var obs = PropertyObserver()
obs.height = 456
obs.height

obs.width = 123
obs.width



/*:
 ---
 ## Type Property
 - Shared
 - Lazily Initialized
 - Class ⭕️   Structure ⭕️   Enumeration ⭕️
 ---
 */
/*
 선언 - static let(var) <#propertyName#>: <#Type#>
       class var <#propertyName#>: <#Type#> { return <#code#> }
 사용 - <#TypeName#>.<#propertyName#>
 
 static: override 불가// 클래스를 인스턴스화 시키지 않고 바로 가져다 쓸수있다. 밑애 print("\(square.width) \(TypeProperty.unit)")처럼
 
 class: 클래스에서만 사용 가능하고 computed property 형태로 사용. 서브클래스에서 override 가능
 */




print("\n---------- [ Type Property ] ----------\n")

class TypeProperty {
  static var unit: String = "cm"
  var width = 5.0
}

let square = TypeProperty()
square.width

let square1 = TypeProperty()
square1.width = 10.0
square1.width

TypeProperty.unit
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")

TypeProperty.unit = "m"         //타입프로퍼티를 사용해서 "m"으로 전부 바꿨다.
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")


//: [Next](@next)
