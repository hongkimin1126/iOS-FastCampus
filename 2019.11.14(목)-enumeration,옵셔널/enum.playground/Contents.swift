import Cocoa
//#########################  신용철형님예제  ########################
enum Food{
case pasta(option:Pasta)
case pizza(option:Pizza)

enum Pasta: Int{
    case cream = 7000
    case tomato = 8000
    case oil = 9000
}

enum Pizza: Int {
    case gorgon = 11000
    case peperoni = 8000
    case potatoPizza = 10000
}
func price (a:Int) -> Int{
        switch self {
        case .pasta(let x): return x.rawValue * a
        case .pizza(let x): return x.rawValue * a
        }
    }
    
}

let aaa:Food = .pasta(option: .cream)
aaa.price(a: 4)


//######################.  내가 연습한것
enum checkin{
    case goobne(Int)
    case bbq(Int)
    case bhc(Int)
    
    
}

var beadal: checkin = .bbq(15)
beadal = .bhc(17)

switch beadal {
case .goobne(let x):
print("개수는:", x)
case .bbq(let x):
print("개수는:", x)
case .bhc(let x):
print("개수는:", x)
}
