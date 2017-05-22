class Dog {
    var name : String{
        willSet{
            print("값이 \(self.name)에서 \(newValue)로 바뀔 예정")
        }
        didSet{
            print("값이 \(oldValue)에서 \(self.name)으로 바뀌었음")
        }
    }
    
    var simpleDescription:String {
        return "강아지 \(name)"
    }
    
    init(name: String){
        self.name = name
    }
    
    //init 과 반대되는 파괴자 deinit 이 있음
    deinit {
        print("개가 메모리에서 해제됨")
    }
}
//foo 안에서 dog 가 있기에 foo 함수가 끝나면서 dog class 의 deinit 호출 됨
func foo(){
    var dog = Dog(name:"멍멍이")
    dog.name = "찡코"
}
foo()



// 튜플 ( Tuple)
let coffee = ("아메리카노",4300)
coffee.1


typealias CoffeeInfo = (name:String, price:Int)
let coffeeInfo: [CoffeeInfo] = [
    ("아메리카노", 4300),
    ("라떼", 4500),
    ("핸드드립",6000),
    ("아포가토",10_000),
]

func find(name: String ) -> CoffeeInfo? {
    for info in coffeeInfo {
        if info.0 == name{
            return info
        }
    }
    
    return nil
}

find(name:"라떼")?.1 // 4500


//enum

enum Month: Int {
    case jan = 1
    case feb
    case mar
    
    func displayName() -> String {
        switch self{
        case .jan:
            return "1월"
        case .feb:
            return "2월"
        case .mar:
            return "3월"
        }
    
    }
}

let month = Month.jan
month.rawValue

month.displayName()



//protocol

protocol Sendable{
    func send()
    var to:String { get  }
}



struct Mail: Sendable{
    var to : String {
        return "ABC"
    }
    
    func send(){
        print("Mail Send")
    }
}


struct SMS : Sendable {
    var to:String
    func send(){
        print("SMS Send")
    }
}



