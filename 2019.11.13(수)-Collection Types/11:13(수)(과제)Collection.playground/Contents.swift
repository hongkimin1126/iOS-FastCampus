import Cocoa

//[ 과제 ]
//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321 , 10293 -> 39201
//- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
//  ex) true - 123, 310, 369   /  false - 100, 222, 770



//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321 , 10293 -> 39201

func num(_ a: Int)
{

    var array: [String] = []
    for i in "\(a)"
    {
        array.append("\(i)")

    }

    array.reverse()
    var sum = "" 
    for i in 0..<array.count
    {
        sum += array[i]

    }


    print(sum)


}

num(123)







//- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
//  ex) true - 123, 310, 369   /  false - 100, 222, 770

//먼전 100~900 을 입력받을 함수 구현한다. ->> 배열로 만들어서 -> 만약 1,5,5 라면 [0]과[1]비교, [0]과[2]비교, [1]과[2] 비교한다.



func soo(_ aa: Int)                             //불타입 필요한가???
{
    var array2: [String] = []
    for i in "\(aa)"
    {
        array2.append("\(i)")
        
    }
    
    
    if array2[0] != array2[1] , array2[0] != array2[2] , array2[1] != array2[2]
    {
        print("True.")
    } else
    {
        print("false")
    }
    
    
    
    
}

soo(153)
