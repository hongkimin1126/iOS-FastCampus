//: [Previous](@previous)
/*:
 ## Set
 - Unordered Collection
 - Unique Value
 - Set Literal = Array Literal
 */
//                                  Set는 상대적으로 많이 사용하지 않는다.     $$$$$$$$$$$$$$$$$$$$$$$4사용할일이 거의 없다.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
// 배열 / 딕셔너리에 비해 중요도 ↓


//let fruitsArr = ["Apple", "Orange", "Melon"]
//let numbersArr = [1, 2, 3, 3, 3]
//let emptyArr = [String]()


let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]      //중복 제거한다 유니크한거라서!
let emptySet = Set<String>()


/*:
 ### Number of Elements
 */
fruitsSet.count

if !fruitsSet.isEmpty {
  print("\(fruitsSet.count) element(s)")
} else {
  print("empty set")
}

/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")



let x: Set = [1, 2, 3, 4, 5]
let y: Set = [1, 2, 3, 4, 5]
x
y

//fruitsSet[0]    // 순서 X -> Index X
x.first   // O


if fruitsSet.contains("Apple") {
  print("Contains Apple")
}

let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
for element in productSet {
  if element.hasPrefix("i") {
    print(element)
  }                     //hasPrefix는 문자열에 i가 있는지 확인하는 기능
}


/*:
 ### Add a New Element
 */
print("\n---------- [ Add ] ----------\n")

//[1,2,3].append(1)             //에러가 발생한다.배열에서는 가능하지만 set는 순서가 없어서 불가능한것이다.
//[1,2,3].insert(2, at: 0)      //이것도 안된다 인덱스 자체가 있는것이 아니라서 아래처럼 해야한다.

var stringSet: Set<String> = []
stringSet.insert("Apple")
stringSet

stringSet.insert("Orange")
stringSet

stringSet.insert("Orange")          //위에 오랜지 있고 set는 유니크 해야 하니까 더이상 추가 되지 않는다.
stringSet


/*:
 ### Remove an Element
 */
print("\n---------- [ Remove ] ----------\n")

stringSet = ["Apple", "Orange", "Melon"]

stringSet.remove("Apple")

if let removed = stringSet.remove("Orange") {
  print("\(removed) has been removed!")
}

stringSet

stringSet.removeAll()


/*:
 ### Compare two sets
 */
print("\n---------- [ Compare ] ----------\n")

var favoriteFruits = Set(["Apple", "Orange", "Melon"])
var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

if favoriteFruits == tropicalFruits {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}


var favoriteFruits1 = Set(["Orange", "Melon", "Apple"])
var favoriteFruits2 = Set(["Apple", "Melon", "Orange"])

favoriteFruits1 == favoriteFruits2                  //set 라서 위에 순서가 달라도 true가 나온다
favoriteFruits1.elementsEqual(favoriteFruits2)      //elementsEqual(favoriteFruits2)는 순서를 비교 하겠다는 기능!!



// 포함 관계 여부. 상위/하위 집합.
// group1 ⊇ group2
let group1: Set = ["A", "B", "C"]
let group2: Set = ["A", "B"]

// superse
group1.isSuperset(of: group2)           //상위 집합인지 알려주는 기능 //참
group1.isStrictSuperset(of: group2)     //참
// strictSuperset - 자기 요소 외 추가 요소가 최소 하나 이상 존재해야 함
group1.isStrictSuperset(of: group1)

// subset
group2.isSubset(of: group1)
group2.isStrictSubset(of: group1)
group2.isStrictSubset(of: group2)


/*:
 ---
 ## Fundamental Set Operations
 - intersection - 교집합
 - symmetricDifference - 교집합의 여집합
 - union - 합집합
 - subtracting - 차집합
 ---
 */

//: ![Set](FundamentalSetOperations.png)



/*:
 ### intersection
 */
print("\n---------- [ intersection ] ----------\n")


favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// isDisjoint - 공집합일 경우 true 반환
if favoriteFruits.isDisjoint(with: tropicalFruits) {
  print("favoriteFruits ∩ tropicalFruits = ∅")
} else {
  print("favoriteFruits ∩ tropicalFruits")
}

// 교집합에 해당하는 요소를 반환
let commonSet = favoriteFruits.intersection(tropicalFruits)
commonSet

// 교집합에 해당하는 요소만 남기고 나머지 제거
tropicalFruits.formIntersection(favoriteFruits)
tropicalFruits



/*:
 ### symmetricDifference
 */
print("\n---------- [ symmetricDifference ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 교집합의 여집합 요소들을 반환
let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
exclusiveSet

// 교집합의 여집합 요소들로 데이터 변경
favoriteFruits.formSymmetricDifference(tropicalFruits)
favoriteFruits


/*:
 ### union
 */
print("\n---------- [ union ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 합집합 반환
var unionSet = favoriteFruits.union(tropicalFruits)
unionSet

// 합집합 요소들로 데이터 변경
favoriteFruits.formUnion(tropicalFruits)
favoriteFruits

/*:
 ### subtracting
 */
print("\n---------- [ subtracting ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 차집합 반환
let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
uncommonSet

// 교집합 요소 제거
favoriteFruits.subtract(tropicalFruits)
favoriteFruits

//: [Next](@next)
//실습 문제 ]
//<1>
//[보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
//위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
//스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
//<2>
//임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
//<3>
//0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
//입력 : [1, 3, 3, 3, 8]
//결과 : "숫자 1 : 1개, 숫자 3 : 3개, 숫자 8 : 1개"
