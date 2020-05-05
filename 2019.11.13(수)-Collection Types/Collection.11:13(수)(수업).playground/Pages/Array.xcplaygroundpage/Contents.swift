//: [Previous](@previous)
import Foundation
/*:
 ---
 ## Array
 - Ordered Collection
 - Zero-based Integer Index
 ---
 */

/*:
 ### Mutable, Immutable
 */

var variableArray = [1, 2]
variableArray = []              //초기화 시키겠다


let constantArray = [1, 2]      //let라서 접근 안된다.
//constantArray = []            //초기화 되지 않는다.


/*:
 ### Array Type
 */

var arrayFromLiteral = [1, 2, 3]        //Int 타입의 어레이
arrayFromLiteral = []
arrayFromLiteral.removeAll()

//let emptyArray = []                   //추론할 타입이 없어서 에러가 발생한다.

//let emptyArray: [String] = []          //이건 문자열을 선언했기에 문제가 없다.


/*:
 ### Initialize
 */

// Type Annotation                 //어노테이션은 형을 지정해주고
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]          //일반적으로는 이걸로 사용하고 위에꺼는 정석으로 표현한것이다.

// Type Inference                   //추론
let strArray3 = ["apple", "orange", "melon"]
let strArray4 = Array<String>(repeating: "iOS", count: 5)  //===>  [iOS, iOS, iOS, iOS, iOS]

// Error
//let strArray5 = ["apple", 3.14, 1]


/*:
 ---
 ### Question
 - String 타입과 Int 타입으로 각각 자료가 없는 상태인 빈 배열을 만들어보세요.
 - Double 타입은 Type Annotation, Bool 타입은 Type Inference 방식으로 각각 임의의 값을 넣어 배열을 만들어보세요.
 ---
 */


var a: [String] = []
var b: [Int]    = []

let array1: [Int] = [1,2,4]
let array2 = [1,2,3]


//Type Annotatio 형지정,   Type Inference은 추론이다

var array3: [Double] = [2.4, 3.5, 6.7]
var array4 = [2.4, 3.5, 6.7]
/*:
 ### Number of Elements
 */
print("\n---------- [ Number of Elements ] ----------\n")

let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count                                    //몇개가 들어있는지 알려주는것 .count    //3

if !fruits.isEmpty {                                                // fruits.isEmpty 값이 있냐고 물어보는 기능
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}


/*:
 ### Retrieve an Element
 */
//              0        1         2
// fruits = ["Apple", "Orange", "Banana"]
//
//fruits[0]
//fruits[2]
//fruits[123]

//fruits.startIndex                      //fruits1.startIndex는 인덱스를 알려주고, fruits[fruits.startIndex]  는  값을 알려준다.
fruits.endIndex-1

fruits[fruits.startIndex]               //(fruits.startIndex) ==>Apple
fruits[fruits.endIndex - 1]             //(fruits.endIndex)는 바나나 다음이라서 우리가 원하는 끝을 불러오려면 (fruits.endIndex - 1) 를 해줘야한다!!!!!!!!!!!!!!



fruits.startIndex == 0
fruits.endIndex - 1 == 2


/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") {                                         //(alphabet.contains("A") 원하는 값 찾을 떄 사용한다
  print("contains A")
}

if alphabet.contains(where: { str -> Bool in
  // code...                            //세부조건을 널을수 없고 where
  return str == "A"
}) {
  print("contains A")
}
                                                                    // (alphabet.firstIndex(of: "D")) 는 특정값의 위치를 찾아낼떄 시용한다.
if let index = alphabet.firstIndex(of: "D")                      //여기 해석중요 값이 있으면 실행하겠다!!! alphabet.firstIndex(of: "D")은 불리언이 아니라서 let index
{
    //alphabet[index] = "K"
  print("index of D: \(index)")
}
alphabet.firstIndex(of: "D")

//let idx1= alphabet.firstIndex(of: "D")
//print(idx1)

//let idx2 = alphabet.firstIndex(of: "Q")
//print(idx2)


/*:
 ### Add a new Element
 */

//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B")               //append 값을 추가하겠다는 뜻  보통이걸로 사용함
alphabetArray += ["C"]
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2

//alphabetArray.append(5.0)         //타입이 달라서 에러난다
//alphabetArray + 1                 //타입이 달라서 에러난다

alphabetArray.insert("S", at: 0)    //.insert("S", at: 0)  원하는 위치에 추가하는 기능 S를 0번째 인덱스에 넣겠다 append랑 구별하기!!!!!!!!!!!
alphabetArray.insert("F", at: 3)
alphabetArray

/*:
 ### Change an Existing Element
 */

alphabetArray = ["A", "B", "C"]
alphabetArray.insert("K", at: 1)
alphabetArray[0] = "Z"
alphabetArray


1...5
1..<5
1...

alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...] = ["Q", "W", "E", "R"]                  //a b q w e r
alphabetArray

alphabetArray[2...] = ["Q", "W"]            //a b q w !!!이거는  e r 없어진다!!!!!!
alphabetArray   // 결과???


/*:
 ### Remove an Element
 */
alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0)           //A를 제거가거 제거한값 반환하기 때문에 print(remover)  찍으면 알수있다
alphabetArray

alphabetArray.removeAll()


// index 찾아 지우기
alphabetArray = ["A", "B", "C", "C", "D", "E"]
//                0,  1  ,  2,  3,   4,    5
if let indexC = alphabetArray.firstIndex(of: "C") {             //2가 된다 indexC가
  alphabetArray.remove(at: indexC)
}
alphabetArray


/*:
 ### Sorting
 */

alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle()                                //섞는 기능
//alphabetArray.shuffled()
alphabetArray.sorted()
//alphabetArray.sort()                                    //오름 차순으로 정리
alphabetArray

// shuffle vs shuffled
// sorted vs sort

//func sorted() -> [Element]
//mutating func sort()

//let xx = alphabetArray.shuffle()                //자기 자체도 바뀐다.
//let yy = alphabetArray.shuffled()               //자기는 그대로고 변형한것을 반환

alphabetArray.shuffle()
var sortedArray = alphabetArray.sorted()
sortedArray
alphabetArray



// sort by closure syntax

sortedArray = alphabetArray.sorted { $0 > $1 }      // 원하는 형태로 정렬하기 밑에꺼는 잘 안쓴다.
//alphabetArray.sorted(by: >= )                     //오름 차순정리
sortedArray


/*:
 ### Enumerating an Array
 */
print("\n---------- [ Enumerating an Array ] ----------\n")

// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.firstIndex(of: value)
  {
    print("\(index) - \(value)")                                    //0 - Apple
  }
}


for a in array.enumerated() {                           //enumerated()는 인덱스,value 값들 모두 추출하겠다는 것이다.
  print("\(a.0) - \(a.1)")
//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, element) in array.enumerated() {                //이 형태를 가장 많이 사용한다
  print("\(index) - \(element)")    ////enumerated()는 값들을 추출하겠다는 것이다.
}


for (index, element) in array.reversed().enumerated() {      //.reversed()
  print("\(index) - \(element)")
}


/*:
 ---
 ### Question
 ---
 */
/*
 - ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
 - 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 - 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
 */

// 2번 문제
// ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]

// 3번 문제
// ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59





/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ Answer ] ----------\n")

/*
 ["p", "u", "p", "p", "y"] 라는 배열에서 마지막 "p" 문자 하나만 삭제하기
 */

var puppy = ["p", "u", "p", "p", "y"]
if let lastIndexOfP = puppy.lastIndex(of: "p") {
  puppy.remove(at: lastIndexOfP)
}
puppy


/*
 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
 */

let firstArray = [1, 2, 4, 8, 9, 12, 13]
let secondArray = [2, 5, 6, 9, 13]

var result: [Int] = []

for i in firstArray {
  for j in secondArray {
    if i == j {
      result.append(j)
    }
  }
}

result



/*
 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
 ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
 */

// 1) Swift 에서 제공하는 기본 함수인 max() 를 이용하는 방법
let arr = [50, 23, 29, 1, 45, 39, 59, 19, 15]
arr.max()


// 2) 두 수 중 높은 값을 반환하는 max 를 이용하거나, 3항 연산자를 이용하는 방법
func maximumValue(in list: [Int]) -> Int {
  var maxValue = Int.min //Int.min = 0
  for number in list {
    maxValue = max(maxValue, number)
    
    // 위 함수는 다음의 3항 연산자와 동일
    // maxValue = maxValue < number ? number : maxValue
  }
  return maxValue
}

maximumValue(in: [50, 23, 29, 1, 45, 39, 59, 19, 15])
maximumValue(in: [10, 20, 30, 80, 50, 40])
maximumValue(in: [-6, -5, -4, -3, -2, -1])



//: [Next](@next)
