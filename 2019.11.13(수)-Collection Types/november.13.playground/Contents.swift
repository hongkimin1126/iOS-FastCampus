import UIKit

//[ 과제 ]
//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321 , 10293 -> 39201
// 입력받은 변수를 하나씩 뜯어서 배열로 만든다
//만든 배열을 뒤집어서 다시 뭉친다
func num(a: Int) -> Int{
    
    var arrary: [String] = []
    var sum = ""
    for i in "\(a)" {
        arrary.append("\(i)")
        
        
    }
    
    for q in arrary.reversed(){
        sum += q
        
        
    }
    return Int(sum)!
    
}
num(a: 123)


//- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
//  ex) true - 123, 310, 369   /  false - 100, 222, 770
//1. 세자리 숫자를 입력 받는다 2. 하나씩 쪼개서 배열에 넣은는다 3. 조건문 두개로 비교 하는 방식을 사용한다.

func num2(a: Int) -> Bool{
    var arrary: [String] = []
    
    for i in "\(a)"{
        
        arrary.append("\(i)")
        
        
    }
    
    if arrary[0] != arrary[1], arrary[1] != arrary[2]{
        return true
        //print("각 자리수의 숫자가 모두 다릅니다")
    }else{
        return false
        //print("같은 숫자가 있으니 다시 입력하세요.")
    }
}
num2(a: 234)

