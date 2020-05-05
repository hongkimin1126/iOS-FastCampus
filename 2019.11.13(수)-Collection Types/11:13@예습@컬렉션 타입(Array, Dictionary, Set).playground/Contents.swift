import Cocoa

// 1. Array 선언 및 생성
var integers: Array<Int> = Array<Int>()

// 위와 동일한 표현
// var integers: Array<Int> = [Int]()
// var integers: Array<Int> = []
// var integers: [Int] = Array<Int>()
// var integers: [Int] = [Int]()
// var integers: [Int] = []
// var integers = [Int]()

// 2. Array 활용
integers.append(1)                      //[1]           append는 요소추가할떄 사용한다.
integers.append(100)                    //[1, 100]

// Int 타입이 아니므로 Array에 추가할 수 없습니다
//integers.append(101.1)

print(integers)    // [1, 100]

// 멤버 포함 여부 확인                           //contsins는 요소가 있는지 획인시 사용한다.
print(integers.contains(100)) // true       //위에서 [100]을 넣었기 떄문에 참이다
print(integers.contains(99)) // false

// 멤버 교체
integers[0] = 99

// 멤버 삭제
integers.remove(at: 0)               //0번 인덱스 삭제
integers.removeLast()                //마지막 인덱스 삭제
integers.removeAll()                 //모든 인덱스 삭제시에 사용

// 멤버 수 확인
print(integers.count)               //몇개가 들어 잇는지 확인시에 사용한다

// 인덱스를 벗어나 접근하려면 익셉션 런타임 오류발생
//integers[0]


// 3. 불변 Array: let을 사용하여 Array 선언
let immutableArray = [1, 2, 3]          //let   때문에 변경불가!!!!

// 수정이 불가능한 Array이므로 멤버를 추가하거나 삭제할 수 없습니다
//immutableArray.append(4)
//immutableArray.removeAll()


//var a: [String] = [String]()    // 밑에꺼랑 둘다 빈 Array생성 방법
//var a: [String] = []            //



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Dictionary
//'키'와 '값'의 쌍으로 이루어진 컬렉션 타입
//Array와 비슷하게 여러가지 리터럴 문법을 활용할 수 있어 표현 방법이 다양합니다.


// 1. Dictionary의 선언과 생성
// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
                            //키타입,  값타입
// 위와 동일한 표현
// var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
// var anyDictionary: Dictionary <String, Any> = [:]
// var anyDictionary: [String: Any] = Dictionary<String, Any>()
// var anyDictionary: [String: Any] = [String: Any]()
// var anyDictionary: [String: Any] = [:]
// var anyDictionary = [String: Any]()


// 2. Dictionary 활용
// 키에 해당하는 값 할당
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

print(anyDictionary) // ["someKey": "value", "anotherKey": 100]

// 키에 해당하는 값 변경
anyDictionary["someKey"] = "dictionary"
print(anyDictionary) ["someKey": "dictionary", "anotherKey": 100]

// 키에 해당하는 값 제거
anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil                    //위에 removeValue 와 뭐가 달라???????
print(anyDictionary)


// 3. 불변 Dictionary: let을 사용하여 Dictionary 선언
let emptyDictionary: [String: String] = [:]             //빈 딕셔너니
let initalizedDictionary: [String: String] = ["name": "yagom", "gender": "male"]

// 불변 Dictionary이므로 값 변경 불가
//emptyDictionary["key"] = "value"

// 키에 해당하는 값을 다른 변수나 상수에 할당하고자 할 때는 옵셔널과 타입 캐스팅 파트에서 다룹니다
// "name"이라는 키에 해당하는 값이 없을 수 있으므로 String 타입의 값이 나올 것이라는 보장이 없습니다.
// 컴파일 오류가 발생합니다
// let someValue: String = initalizedDictionary["name"]



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~₩₩
//Set
//중복되지 않는 멤버가 순서없이 존재하는 컬렉션
//Array, Dictionary와 다르게 축약형이 존재하지 않음


// 1. Set 생성 및 선언
var integerSet: Set<Int> = Set<Int>()  //다른 축약 방법 없다

// insert : 새로운 멤버 입력
// 동일한 값은 여러번 insert해도 한번만 저장됩니다.
integerSet.insert(1)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)       //위에 중복되지만 99는 한번만 넣어준다!!!!!!!!!!!!!!!!!!!!!
integerSet.insert(100)

print(intigerSet) // {100, 99, 1}

// contains: 멤버 포함 여부 확인
print(integerSet.contatins(1)) // true
print(integerSet.contains(2)) // false

// remove: 멤버 삭제
integerSet.remove(99) // {100, 1}
integerSet.removeFirst() // {1}

// count: 멤버 개수
integerSet.count // 1


// 2. Set의 활용
// 멤버의 유일성이 보장되기 때문에 집합 연산에 활용하면 유용합니다.
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union) // [2, 4, 5, 6, 7, 3, 1]

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()         //sorted는 정렬시 사용한다
print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]

// 교집합
let intersection: Set<Int> = setA.intersection(setB)            //교잡합
print(intersection) // [5, 3, 4]

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)          //차집합
print(subtracting) // [2, 1]
