//: [Previous](@previous)
import Foundation

/*:
 ## Dictionary
 - Element = Unique Key + Value
 - Unordered Collection
 */

/*:
 ### Dictionary Literal
 */


//var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]            //value는 같을수 있으나 key는 같을수 없다.
//var dictFromLiteral = [1: "value 1", 2: "value 2"]
//var dictFromLiteral = ["1": 1, "2": 2]
//dictFromLiteral = [:]

// 오류
//var dictFromLiteral = [:]                                                         //????? var dictFromLiteral:   [String:String]

/*:
 ### Dictionary Type
 */
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]               //간단해서 주로 이거 사용한다 위에꺼는 정석
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]


/*:
 ---
 ### Question
 - 키가 String이고 값이 Int 타입인, 자료가 없는 상태의 빈 딕셔너리를 만드세요.
 - Type Annotation 과 Type Inference 방식을 모두 이용해 여러 가지 데이터를 넣어 딕셔너리를 만들어보세요.
 ---
 */
let abs: [String: Int] = [:]
let abs2 = ["a1": 1, "a2": 2, "a3": 3]
let abs3: [String: Int]
                                      
let a:Int
/*:
 ### Number of Elements
 */
print("\n---------- [ Number of Elements ] ----------\n")           //?????????못들으무ㅜ

var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if words.isEmpty {
  print("\(countOfWords) element(s)")
} else {
  print("empty dictionary")
}

/*:
 ### Retrieve an Element
 */
print("\n---------- [ Retrieve ] ----------\n")

words["A"]
words["Q"]

if let aValue = words["A"] {
  print(aValue)
} else {
  print("Not found")
}

if let zValue = words["Z"] {
  print(zValue)
} else {
  print("Not found")
}

print(words.keys)
print(words.values)

let keys = Array(words.keys)        //Array를 안붙이면 딕셔너리로 만들어진다 그래서 배열로 만들려면 브ㅜㅌ여라ㅣ
let values = Array(words.values)                //value만 따로 배열로 만들겠다



/*:
 ### Enumerating an Dictionary
 */
print("\n---------- [ Enumerating ] ----------\n")  

let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
  print("\(key): \(value)")
}

for (key, _) in dict {      //key만 출력할때
  print("Key :", key)
}

for (_, value) in dict {
  print("Value :", value)   //value만 출력할ㄸ
}

for value in dict.values {  //dict.values 바로 위에랑 같은 결괴
  print("Value :", value)
}



/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

//var words = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, _) in words {
  if key == "A" {
    print("contains A key.")
  }
}


if words.contains(where: { (key, value) -> Bool in         // ????????????????????????????????????????????????????????????????????????  이렇게 잘안쓴다!!
  return key == "A"
  }) {
  print("contains A key.")
}


/*:
 ### Add a New Element
 */
words = ["A": "A"]

words["A"]    // Key -> Unique

words["A"] = "Apple"        //기존 "A"는 없어지고  "Apple"로 교체된다.
words

words["B"] = "Banana"       //"Banana"생성
words

words["B"] = "Blue"         //"Banana"가 "Blue"가 교체된다.
words


/*:
 ### Change an Existing Element
 */
print("\n---------- [ Change ] ----------\n")

words = [:]
words["A"] = "Application"
words

words["A"] = "App"
words


// 키가 없으면 데이터 추가 후 nil 반환,
// 키가 이미 있으면 데이터 업데이트 후 oldValue 반환

if let oldValue = words.updateValue("Apple", forKey: "A")                   //updateValue는 App => Apple 로 교체는 결과를 가지지만  updateValue값자체는 App이 된다!!!!!!
{                                                                           //remove도 마찬가지이다.
  print("\(oldValue) => \(words["A"]!)")        //위에 옵셔널은 oldValue 값나온거라 words["A"]! 옵셔널 따로 적지만 이코딩 말도 안된다 사실은 잘못된것!!!!
} else {
  print("Insert \(words["A"]!)")
}
words


if let oldValue = words.updateValue("Steve Jobs", forKey: "S") {
  print("\(oldValue) => \(words["S"]!)")
} else {
  print("Add S Key with \(words["S"]!)")
}
words

/*:
 ### Remove an Element
 */


print("\n---------- [ Remove ] ----------\n")

words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs", "T": "Timothy Cook"]
words["S"] = nil                                                                //S value가뵤 어뵤어져서 "S" 자체가 사라진다
words["Z"] = nil
words

// 지우려는 키가 존재하면 데이터를 지운 후 지운 데이터 반환, 없으면 nil
if let removedValue = words.removeValue(forKey: "T") {
  print("\(removedValue) removed!")
}
words

words.removeAll()



/*:
 ### Nested
 */
print("\n---------- [ Nested ] ----------\n")               //나중되며 많이 사용한다.

var dict1 = [String: [String]]()    //딕셔너리 안에 값을 배열로 하겠다
//dict1["arr"] = "A"
dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1


var dict2 = [String: [String: String]]()    //딕셔너리 안에서 값에 또 딕셔너리를 넣겠다.
dict2["user"] = [
  "name": "나개발",
  "job": "iOS 개발자",
  "hobby": "코딩",
]
dict2



// 예
[
  "name": "나개발",
  "job": "iOS 개발자",
  "age": 20,
  "hobby": "코딩",
  "apps": [
    "이런 앱",
    "저런 앱",
    "잘된 앱",
    "망한 앱",
  ],
  "teamMember": [
    "designer": "김철수",
    "marketer": "홍길동"
  ]
] as [String: Any]                          //Any 사용하면 아무 타입이나 사용이 가능하다.


/*:
 ---
 ### Question
 - Dictionary로 저장되어 있는 시험 성적의 평균 점수 구하기
 - Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
 - 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기
 - 위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
 ---
 */

// 1번 문제
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
// 결과 : 91.25

// 2번 문제
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
// 결과 : [("kor", 92), ("eng", 88), ("math", 96), ("science", 89)]

// 3번 문제
/*
 패스트캠퍼스
  - 스쿨
   * iOS 스쿨
   * 백엔드 스쿨
   * 프론트엔드 스쿨
  - 캠프
   * A 강의
   * B 강의
  - 온라인
   * C 강의
   * D 강의
  */

// 4번 문제
// 자세한 내용은 Optional 시간에 배울 예정


/*:
 ---
 ### Answer
 ---
 */

// Dictionary 로 저장되어 있는 시험 성적의 평균 점수 구하기
let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]

var sum = 0
for score in scores.values {
  sum += score
}
var average = Double(sum) / Double(scores.values.count) //score.count 값이랑 똑같다.
print(average)



// Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
var scoreArr: [(String, Int)] = []

//1)
for (key, value) in scores {
  scoreArr.append((key, value))
}

//2)
//for dict in scores {          //위에랑 똑같다 이게 더 편할수도
//  scoreArr.append(dict)
//}


//3)
//scoreArr = Array(scores)      //위에랑 결과는 같다.

scoreArr




// 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기

/*
 패스트캠퍼스
  - 스쿨
    * iOS 스쿨
    * 백엔드 스쿨
    * 프론트엔드 스쿨
  - 캠프
    * A 강의
    * B 강의
  - 온라인
    * C 강의
    * D 강의
 */

let fastcampus = [
  "패스트캠퍼스": [
    "스쿨": ["iOS 스쿨", "백엔드 스쿨", "프론트엔드 스쿨"],
    "캠프": ["A 강의", "B 강의"],
    "온라인": ["C 강의", "D 강의"],
  ]
]


// 위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
// 자세한 내용은 Optional 시간에 배울 예정

if let 패캠 = fastcampus["패스트캠퍼스"] {
  if let 스쿨 = 패캠["스쿨"] {
    print(스쿨[0])
  }
}

if let 패캠 = fastcampus["패스트캠퍼스"], let 스쿨 = 패캠["스쿨"], let iOS = 스쿨.first {
  print(iOS)
}

print(fastcampus["패스트캠퍼스"]!["스쿨"]![0]) //이거 웬만하면 쓰지 말아라!!!!!!




//: [Next](@next)
