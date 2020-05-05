//: [Previous](@previous)
/*:
 # Equatable, Identical
 */

// 동등 연산자
1 == 1
2 == 1
"ABC" == "ABC"


class Person {
  let name = "이순신"
  let age = 30
}

let person1 = Person()
let person2 = Person()

//person1 == "이순신"    // 에러
//person1 == person2   //비교 할수 없다 왜냐면 이름만 같으면 같다고 해야할지 나이만 같으면 같다고 해야할지 정할수 없다.


/*:
 ---
 ### Question
 - 왜 비교 연산자를 사용할 수 없을까요?
 ---
 */

/*:
 ---
 ### Equatable Protocol
 ---
 */

class User: Equatable               //?????????????????????????이해 못함?????????????
{
  var name = "이순신"
  let age = 30
  
  static func ==(lhs: User, rhs: User) -> Bool {
    return lhs.name == rhs.name         //이름이 같으면 같다고 하겠다는 의미
  }
}

let user1 = User()  //정의에서는 비교가 안됬지만 위에서 이름만 같으면 비교할수 있게 만들었기 때문에 가능하다.
var user2 = User()
user1 == user2


/*:
 ---
 ### Identical
 ---
 */

user1.name
user2.name
user1 == user2      //(==) 값이 같은지 확인하는것 true
user1 === user2     //(===) 주소값을 비교하는것  false



/*
 let x = 5           //스택
 let y = User()      //스택 -> 힙
 let z = User()
 
           x   y        z
 [ Stack ] | 5 | 0x5F17 | 0x2C90 |
                   |        |
                   ---------|----------
           ------------------         |
           |                          |
         0x2C90          0x5F16     0x5F17
 [ Heap ]  | z's user data | SomeData | y's user data |
 
 --- in Memory ---
 값 타입(Value Type) - Stack
 참조 타입(Reference Type) - Stack -> Heap
 */


user1.name = "홍길동"
user1.name   //
user2.name   //
user1 == user2
user1 === user2


user2 = user1      //주소를 같게 해주는 작업

// user1 -> 0x00001  <- user2       0x00002

//user1.name
//user2.name
//user1 == user2    //
//user1 === user2   //
//
//user2.name = "세종대왕"
//user2.name
//user1.name


/*
 Identity Operators
 === : 두 상수 또는 변수가 동일한 인스턴스를 가르키는 경우 true 반환
 */

//1 === 1       //애러
//"A" === "A"   //애러

// 5 == 5


//: [Next](@next)
