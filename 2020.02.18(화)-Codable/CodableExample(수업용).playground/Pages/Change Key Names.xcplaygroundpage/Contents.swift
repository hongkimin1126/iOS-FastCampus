//: [Previous](@previous)
//MARK: 이름이 이상할때 우리가 원하는 이름으로 변경하는 과정!
import Foundation

let jsonData = """
{
  "user_name": "James",
  "user_email": "abc@xyz.com",
  "gender": "male",
}
""".data(using: .utf8)!


struct User: Decodable {
    let name: String
    let email: String
    let gender: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "user_name"
        case email = "user_email"
        case gender //이거는 변경할필요어뵤어서 그냥 둠.
    }
}


let decoder = JSONDecoder()
do {
    let user = try decoder.decode(User.self, from: jsonData)
    print(user)
    
} catch{
    print(error.localizedDescription)
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
