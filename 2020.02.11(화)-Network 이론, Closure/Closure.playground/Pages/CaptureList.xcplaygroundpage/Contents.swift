//: [Previous](@previous)
//: # CaptureList
/*:
 ---
 ## Value Type
 ---
 */
print("\n---------- [ Value Type ] ----------\n")

var a = 0
var b = 0
var c = 0
var result = 0


let valueCapture1 = {
  result = a + b + c
  print("내부 값 :", a, b, c, result)//여기서 값은 0,0,0,0이다.
}

(a, b, c) = (1, 2, 3)
result = a + b + c
print("초기 값 :", a, b, c, result)

valueCapture1() //위에서 0,0,0,0이었어도 더해준 바로위에서 변경한후에 여기서 다시 실행하면  값은 1,2,3,6이다.

print("최종 값 :", a, b, c, result)
print()


// Capture List : [a, b]

let valueCapture2 = { [a, b] in //[a, b]는 캡쳐리스트인데 위에서 (1,2)로 설정해주었기 때문에 고정된다.
  result = a + b + c //a,b는 고정되었고 c는 밑에서 9로 변경되었기 때문에 1+2+9 가 된다.
  print("내부 값 :", a, b, c, result) //1,2,9,12
}

(a, b, c) = (7, 8, 9)
result = a + b + c
print("초기 값 :", a, b, c, result) //7,8,9 ,24

valueCapture2()
print("최종 값 :", a, b, c, result) //7,8,9,12  result는 위위에서 계산한결과인 12가 된다. // 이거근데 왜 a,b값은 왜 변경된거야?????? result는 변경안됐잖아!!!!!!!!!!



/*:
 ---
 ## Reference Type
 ---
 */
print("\n---------- [ Reference Type ] ----------\n")
//MARK: Value Type과 Reference Type은 캡쳐가 다르다.

final class RefType {
  var number = 0
}
var x = RefType()
var y = RefType()
print("초기 값 :", x.number, y.number) // 0 , 0

let refCapture = { [x] in
    
  print("내부 값 :", x.number, y.number) //x.number: 여기서(x)는 값이 아니라 값을 가진 주소가 고정된다. 그래서 밑에서 넘버를 바꿨을때 값이 바뀌는거다. 주소는 고정이라.
}
x.number = 5
y.number = 7
print("변경 값 :", x.number, y.number) //5, 7

refCapture()
print("최종 값 :", x.number, y.number)//5, 7 ?????????????????? 위에 캡쳐로 x 고정했는데 왜 값 변경된거야???


/*:
 ---
 ## Binding an arbitrary expression
 ---
 */
print("\n---------- [ binding ] ----------\n")
let captureBinding = { [z = x] in //[z = x] 캡쳐리스트를 통해 변수이름을 변경할수도 있다.
  print(z.number)//내부에서 z라고 사용할수있다.
}
let captureWeakBinding = { [weak z = x] in //x는 참조타입이라서 z가 값을 받을때 x에대해서 (weak,unowned)를 붙여서 참조카운트를 올리지 않는다.!! ???????????????????????????????????
  print(z?.number ?? 0)
}
let captureUnownedBinding = { [unowned z = x] in
  print(z.number)
}

captureBinding()
captureWeakBinding()
captureUnownedBinding()



//: [Next](@next)
