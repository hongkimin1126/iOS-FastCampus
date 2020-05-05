//: [Previous](@previous)
/*:
 # Conditional Statements
 */

/*:
 ---
 ## if Statements
 ---
 */
/*
 if <#condition#>
 {
   <#code#>
 }
 
 if <#condition#>
 {
   <#statements#>
 } else
 {
   <#statements#>
 }
 
 - condition 은 Bool 값 (true, false)
 */

// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32
{
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32
{
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32
{
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86
{
  print("It's really warm. Don't forget to wear sunscreen.")
} else
{
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if

temperatureInFahrenheit = 72                                //만족하는게 없어서 출력값이 없다. else가 없어서 이다.
if temperatureInFahrenheit <= 32
{
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86
{
  print("It's really warm. Don't forget to wear sunscreen.")
}



// true && true = true
// true && false = false

// Logical And Operator
if (temperatureInFahrenheit > 0) && (temperatureInFahrenheit % 2 == 0)                  //if문 조건 사용법
{
}

// Logical And Operator
if temperatureInFahrenheit > 0, temperatureInFahrenheit % 2 == 0                        //(,)and랑 같은거다&&
{
}

// Logical Or Operator
if temperatureInFahrenheit > 0 || temperatureInFahrenheit % 2 == 0                      // ||or는 그냥 써야한다
{
}

/*:
 ---
 ### Question
 - if ~ else if   /  if 문을 2개 하는 것과 차이점?
 - if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
 ---
 */

// if ~ else if   /  if 문을 2개 하는 것과 차이점?

var number = 9
if number < 10
{
  print("10보다 작다")                        //else if는 조건에 맞는거 위에 하나만 값이나온다.!!!!!!!!!!!!!!
} else if number < 20
{
  print("20보다 작다")
}

if number < 10
{
  print("10보다 작다")
}                                        //else if랑 다르게 조건 두개 값이 다나온다.!!!!!!!!!!!!!!
if number < 20
{
  print("20보다 작다")
}



// if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
number = 25

if number < 10
{
  print("10보다 작다")
} else if number < 20
{
  print("20보다 작다")
} else
{
  print("20과 같거나 크다")
}


if number < 10
{
  print("10보다 작다")
} else if number < 20
{
  print("20보다 작다")
} else if number >= 20                     //else랑 같게 하기위한 조건이다 (>= 20)
{
  print("20과 같거나 크다")
}




/*:
 ---
 ## switch Statements
 ---
 */
/*
 switch <#value#>.
 {
 case <#value 1#>:
     <#respond to value 1#>
 case <#value 2#>,
      <#value 3#>:
     <#respond to value 2 or 3#>
 default:
     <#otherwise, do something else#>
 }
 
 - switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 
 */

print("\n---------- [ switch statements ] ----------\n")

let alphabet: Character = "a"

switch alphabet                                                                 //defalult 무조건 넣어라
{
case "a":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
  break
//  print("Some other character")
}


// Without default case

let isTrue = true                                              //불값으로 사용법
type(of: isTrue)

switch isTrue
{
case true:
  print("true")
case false:
  print("false")
}



// Interval Matching

print("\n---------- [ Interval Matching ] ----------\n")

let approximateCount = 30

switch approximateCount
{
case 0...50:                                                //범위로 처리하기
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
default:
  print("Something else")
}


/*:
 ---
 ### Question
 - 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.
 ---
 */
// 하단 Answer 참고

/*
 if temperatureInFahrenheit <= 32 {
 print("It's very cold. Consider wearing a scarf.")
 } else if temperatureInFahrenheit >= 86 {
 print("It's really warm. Don't forget to wear sunscreen.")
 } else {
 print("It's not that cold. Wear a t-shirt.")
 }
 */

let a = 45

switch a {
case  0...32:                                                                               //범위 잡는거
    print("It's very cold. Consider wearing a scarf.")
case  86...:
     print("It's really warm. Don't forget to wear sunscreen.")
default:
    print("It's not that cold. Wear a t-shirt.")
}


// Compound Cases

// if문은 콤마(,)가 And(&&)연산인 것과 반대로 switch문은 콤마(,)가 Or(||) 연산

let someCharacter: Character = "e"

switch someCharacter
{
case "a", "e", "i", "o", "u":                                            //모음
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",                   //자음분리
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}



// value binding

// ###########################  x, y 좌표  ####################
let somePoint = (9, 0)

switch somePoint
{
case (let x, 0), (0, let x):
  print("On an axis, \(x) from the origin")
default:
  print("Not on an axis")
}


// where clause                                                             //  where 구문!!!!!!

let anotherPoint = (1, -1)
switch anotherPoint
{
case let (x, y) where x == y:                                             //x,y가 같을때
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:                                            //x,y가 부호가 반대일때
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
}


let ttt = -1

switch ttt
{
case let x where x % 2 == 0:                                                //where 실예제   x % 2 == 0 ==>  x.isMultiple(of: 2) 같은기능!!!!
    print("짝수")

default:
    print("홀수")
}
/*:
 ---
 ### Question
 - 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
 ---
 */
// 하단 Answer 참고




// fallthrough

print("\n---------- [ fallthrough ] ----------\n")
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe
{
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough                                           //fallthrough 없다면 밑에 디폴트 출력 안된다.  자주 쓸일은 없을것이다.
default:
  description += " an integer."
}
print(description)



/*:
 ---
 ## Early Exit
 - guard statement
 ---
 */
/*
 if <#condition#>
 {
 <#code#>
 } else if <#condition#>
 {
 <#code#>
 }
 - 특정 조건을 만족하면 해당 분기문 실행
 
 guard <#condition#> else
 {
 <#code#>
 }
 - 조건에 맞지 않으면 바로 종료.
 - 들여쓰기 중첩 방지
 */
//##################################################.  (~=)
func update(age: Int)
{
  if 1...100 ~= age     //1 <= age <= 100
  {
    print("Update")
  }
}



//func update(age: Int) {
//  switch age {
//  case 1...100: print("Update")
//  default: break
//  }
//}

//func update(age: Int) {
//  guard 1...100 ~= age else { return }
//  print("Update")
//}

update(age: -1)
update(age: 2)
update(age: 100)



func someFunction()
{
  // ...
  // ...
  
  // if 문의 조건이 맞으면 어떤 코드를 수행할 것
  if Bool.random()
  {
    // ...
  }

  // gaurd문의 조건을 만족할 때만 다음으로 넘어갈 것
  guard Bool.random() else { return }                                           //가든?????????????????????????????
  
  // ...
  // ...
}




/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

// if - else if - else 문을 switch 문으로 바꿔보세요.
switch temperatureInFahrenheit
{
case ...32:
  print("It's very cold. Consider wearing a scarf.")
case 86...:
  print("It's really warm. Don't forget to wear sunscreen.")
default:
  print("It's not that cold. Wear a t-shirt.")
}



// 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
let even = 15
switch even
{
case let x where x.isMultiple(of: 3):    //isMultple 배수인지 알고싶을때 사용한다.
  print("\(x)는 짝수")
default:
  print("홀수")
}


//: [Next](@next)
