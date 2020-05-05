//: [Previous](@previous)
/*:
 ---
 ## forEach
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태
 ---
 */
print("\n---------- [ forEach ] ----------\n")

let immutableArray = [1, 2, 3, 4]

for num in immutableArray {
  print(num, terminator: " ")
}
print() //줄바꿈 효과 줄려고함.

immutableArray.forEach { num in
  print(num, terminator: " ")
}
print()


immutableArray.forEach { //위에 num생략한거 , forEach는 함수라서 break로 빠져나오지 않고 끝까지 실행된다.
  print($0, terminator: " ")
}
print()


func printParam(_ num: Int) { //(Element) -> (Void)
  print(num, terminator: " ")
}
immutableArray.forEach(printParam(_:))
print()


/*:
 ---
 ### Question
 - forEach 와 for 문의 차이점은?
 - 1~10 까지의 숫자 중 짝수만 출력하다가 9가 되면 종료되도록 forEach를 이용해 구현해본 뒤 for 와 비교하여 설명
 ---
 */
for i in 1...10 {
    print(i)    //9까지 돌려보고 끝이지만 밑에 forEach는 함수라 10까지 돌려본다.!!!!!!
    guard i != 9  else {break}
    guard i % 2 == 0 else {continue}
//    print(i, terminator: " ")
}
print()

(1...10).forEach {
    print($0)
    guard $0 != 9 else {return} //forEach가 반복문이 아니고 함수라서 break,continue 사용하지않고 return사용함!!!
    guard $0 % 2 == 0 else {return}
//    print($0, terminator: " ")
    print()
}

/*:
 ---
 ## map
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환
 ---
 */

print("\n---------- [ Map ] ----------\n")

let names = ["Chris", "Alex", "Bob", "Barry"]
let ages = ["1", "2", "3"]

let x = names.map { $0 + "'s name" } //["Chris's", "Alex's", "Bob's", "Barry's"]
let y = ages.map {Int($0)} //숫자로 바꿔서 컬렉션(배열)으로 반환!

//names
//  .map { $0 + "'s name" }
//  .forEach { print($0) }






let intArr = Array<Int>(repeating: 2, count: 10) //repeating: 2, count: 10): 2를 10번만큼 반복하겠다는 의미
//for (idx, value) in intArr.enumerated() {//enumerated()는 인덱스랑 같이 추출하겠다는거
//  idx + value //현재 인덱스와 값을 반환.
//}


// for 문 비교
var numArr = [Int]() //[Int]()는 초기화 방법중에 하나다. [Int] = []와 같은기능
for (idx, value) in intArr.enumerated() {
  numArr.append(idx + value)
}
print(numArr)

// map
let indexPlusElement = intArr.enumerated().map {
    return $0 + $1 //$0 + $1 enumerated()때문에 인덱스랑 밸류가 알아서 들어간다.
}
print(indexPlusElement)



/*:
 ---
 ## filter
 - 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
 ---
 */
print("\n---------- [ filter ] ----------\n") //filter는 true 일때 값을 유지하고 false 일때 값을 무시한다.

// let names = ["Chris", "Alex", "Bob", "Barry"]

//filter 사용해서 B가 들어가는 이름만 반환하겠다.
let containBNames = names.filter { (name) -> Bool in
    return name.contains("B")
  }
print(containBNames)

names.filter { $0.contains("B") } //위에꺼를 줄인버전

//Alex라는 이름이 몇번 들어갔는지 체크
let names2 = ["Chris", "Alex", "Bob", "Barry","Alex"]
let countAlexNames = names2.filter { $0 == "Alex" }.count
print(countAlexNames) //2


/*:
 ---
 ## reduce
 - 컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환.   e.g. Int, String 타입
 ---
 */
print("\n---------- [ reduce ] ----------\n") //reduce 컬렉션타입으로 반환이아니라 Int, String 타입으로 반환

/*
 (1...100)
   .reduce(<#T##initialResult: Result##Result#>, T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result)
 
 Result Type - 결과로 얻고자하는 값의 타입
 
 initialResult - 초기값
 nextPartialResult - (이전 요소까지의 결과값, 컬렉션이 지닌 현재 요소)
 */

//1~100 더할려고함
let sum1to100 = (1...100).reduce(0) { (sum: Int, next: Int) in
  return sum + next
}
print(sum1to100)
// 0 + 1 = 1    -> 초기값 0 ,next=1
// 1 + 2 = 3    -> sum이 1임,next=2
// 3 + 3 = 6    -> sum이 3임,next=3
// 6 + 4 = 10   -> sum이 6임,next=4
// ....

print((1...100).reduce(0) { $0 + $1 })
print((1...100).reduce(0, +)) // 제일 줄인버전

//sum에 직접더하는게 아니고 리턴값이 섬이 되는거다!!!!
//(1...100).reduce(0) { (sum, next) in
//  sum += next
//}



/*:
 ---
 ### Question
 - 문자열 배열을 reduce를 이용해 하나의 문자열로 합치기
 - 숫자 배열을 reduce를 이용해 하나의 문자열로 합치기
 ---
 */
// 아래 둘 모두 reduce를 이용해 "123" 이라는 문자열이 되도록 만들기
["1", "2", "3"]

[1, 2, 3]

print("\n---------- [ A. reduce ] ----------\n")

let merge1 = ["1", "2", "3"].reduce("") { $0 + $1 } //?????????????????????????이게 뭔소리야??
print(merge1)

let merge2 = [1, 2, 3].reduce("") { $0 + String($1) }//이거 반대로 문자로 만들어준는거
print(merge2)

//위 내용을 Full Syntax 로 표현했을 때
//[1, 2, 3]
//  .reduce("") { (str: String, num: Int) in
//    return str + String(num)
//  }



/*:
 ---
 ## compactMap
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여 변형된 새 컬렉션 반환
 - 옵셔널 제거
 ---
 */
print("\n---------- [ compactMap ] ----------\n")

let optionalStringArr = ["A", nil, "B", nil, "C"]
print(optionalStringArr) //배열에 닐이 하나라도 있으면 전체가 옵셔널이 된다.
print(optionalStringArr.compactMap { $0 })//compactMap사용하면 옵셔널 인자들 제거하고 배열 만들어준다.


let numbers = [-2, -1, 0, 1, 2]
let positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil } //닐을 제거 되기때문에 0보다 큰 값들만 남는다.
print(positiveNumbers)

print(numbers.map { $0 >= 0 ? $0 : nil })//map과 compactMap차이를 보여줌

/*:
 ---
 ## flatMap
 - 중첩된 컬렉션을 하나의 컬렉션으로 병합
 ---
 */
print("\n---------- [ flatMap ] ----------\n")

let nestedArr: [[Int]] = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]] //배열이 중첩
print(nestedArr)     //[[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
print(nestedArr.flatMap { $0 })//[1, 2, 3, 9, 8, 7, -1, 0, 1] 하나의 배열로 만들어줌 flatMap때문에


let nestedArr2: [[[Int]]] = [[[1, 2], [3, 4], [5, 6]], [[7, 8], [9, 10]]] //3중배열
let flattenNumbers1 = nestedArr2.flatMap { $0 } //[[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]] 하나가 풀림 3중에서 2중배열로 바뀜 flatMap때문에
print(flattenNumbers1)

let flattenNumbers2 = flattenNumbers1.flatMap { $0 } //2중배욜을 하나로 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(flattenNumbers2)

nestedArr2.flatMap { $0 }.flatMap { $0 }  //위의 3중배열을 풀어주기위해 2번 작업한것을 간단하게 바꿈.




/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ A. for vs forEach ] ----------\n")

/*
 for문은 반복문이므로 break, continue 키워드 사용
 forEach문은 함수(클로져)이므로 break, continue 대신 return 키워드 사용
 */

for i in 1...10 {
  guard i != 9 else { break }
  guard i % 2 == 0 else { continue }
  print(i, terminator: " ")
}
print()

(1...10).forEach {
  guard $0 < 9 else { return }
  guard $0 % 2 == 0 else { return }
  print($0, terminator: " ")
}
print()


print("\n---------- [ A. reduce ] ----------\n")

let merge11 = ["1", "2", "3"].reduce("") { $0 + $1 }
print(merge11)

let merge22 = [1, 2, 3].reduce("") { $0 + String($1) }
print(merge22)

//위 내용을 Full Syntax 로 표현했을 때
//[1, 2, 3]
//  .reduce("") { (str: String, num: Int) in
//    return str + String(num)
//  }






//: [Next](@next)
