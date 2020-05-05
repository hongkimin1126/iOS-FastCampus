//: [Previous](@previous)
/*:
 # Practice
 */
/*:
 ---
 ## Conditional Statements
 ---
 */
/*
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
   (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 */
// - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
//print("Ho")
//
//func jumsoo(input: Double)
//{
//    switch input
//    {
//    case 4.5:
//        print("당신의 학점은 A+입니다.")
//    case 4.0:
//        print("당신의 학점은 A입니다.")
//    case 3.5:
//        print("당신의 학점은 B+입니다.")
//    default:
//        print("잘못 입력하셨습니다.")
//    }
//}
//
//
//jumsoo(input: 4.5)



//특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
//func month(input: Int)
//{
//
//    switch input
//        {
//        case 1:
//            print("jan")
//        case 2:
//            print("feb")
//        case 3:
//            print("mar")
//        case 4:
//            print("apr")
//        case 5:
//            print("may")
//        case 6:
//            print("june")
//        case 7:
//            print("july")
//        case 8:
//            print("aug")
//        case 9:
//            print("sept")
//        case 10:
//            print("oct")
//        case 11:
//            print("nov")
//        case 12:
//            print("dec")
//
//        default:
//            print("잘못 입력하셨습니다.")
//        }
//
//
//
//}
//
//month(input: 3)

// - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수//(switch where clause 를 이용해 풀어볼 수 있으면 해보기)

func three(a: Int, b: Int, c: Int) -> Bool
{
    let z = a * b * c
    switch z
        {
        case let x where x < 0:
            return false
        case let x where x > 0:
            return true
        default:
            return false
        }

}

three(a: 1, b: -1, c: 1)













/*:
 ---
 ## Loops
 ---
 */
/*
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
   (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
   ex) 5! = 5 x 4 x 3 x 2 x 1
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
   (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
   (1234 인 경우 각 자리 숫자를 합치면 10)
 */

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
//(Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
//ex) 5! = 5 x 4 x 3 x 2 x 1

func factorial(num: Int)
{
    var a = 1;
    var b = 1;
    while a <= num
    {
        b *= a
        a += 1
    
    }
    print(b)
    
    
    
    
}

factorial(num: 5)


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
//(a=2, b=5 를 입력한 경우 결과는 2의 5제곱)


func xx(a: Int, b: Int)
{
   var c = 1
   
    for _ in 1...b    //횟수를 담당하고
    {
        c *= a         //기존값 곱해서 넣겠다
    }
    print(c)
}

xx(a: 2, b: 3)


// - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//  (1234 인 경우 각 자리 숫자를 합치면 10)

func some(a: Int)
{
    
    
    
    
    
    
    
    
    
}








/*:
 ---
 ## Control Transfer
 ---
 */
/*
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 */

//: [Next](@next)
