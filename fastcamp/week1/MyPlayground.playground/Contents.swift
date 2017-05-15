//: Playground - noun: a place where people can play

import UIKit


//타입 추론( Type Inference )

//array type


var city = ["seoul", "tokyo"]


//dictionary
//array 와 마찬가지로 대괄호로 key : value 값으로 매칭됨
var cities = [
    "korea":"seoul",
    "japan":"tokyo"
]

//반복문
//c 스타일의 반복문은 스위프트 2버전에서 사라짐


//0..<10 0<10
//0...10 0<=10
for i in 0..<10 {
    i
}

// 단순히 반복만 하고 싶다면 변수명을 _ (underscore 로 선언한다)
/*
 for _ in 0..<10{
 }
 */



//switch
//default 절 꼭 필요함
//case 절에 범위를 넣을수 있음
//case 10..<31:
let age = 30
switch age{
case 1:
    print("1age")
case 2:
    print("2age")
case 10..<31:
    print("30age")
default:
    print("100age")
    
}


//optional
var str: String = ""
print(str)


var optionalEmail: String? = "bluehyunj@gmail.com"

if let email = optionalEmail{
    print(email)
}

var optionalName: String? = "정현주"
var optionalEmail2: String? = "bluehyunj@gmail.com"

if let name = optionalName,
    let email = optionalEmail2{
    print(name, email)
}


//옵셔널 바인딩 (optional binding)

//var langs: [String]? // 스트링 배열의 옵셔널
//var langs: [String?] // 스트링 배열의 인자값이 옵셔널

var langs: [String]? = ["A", "B"]

//중첩된 if 는 , 로 변경 가능
if let langs = langs , !langs.isEmpty{
    print("foo")
}


//옵셔널 체이닝
if langs?.isEmpty == false{
    print("foo")
}


//옵셔널 벗기기
//! 변수 뒤에 느낌표를 붙이면 강제로 옵셔널을 벗겨서 변수의 값을 가져옴
//주의할점은 nil이 들어가있는 경우 runtime error
//let optionaEmail3: String? = nil
let optionaEmail3: String? = "AAAA"
print(optionaEmail3)
print(optionaEmail3!)


// 암묵적으로 벗겨진 옵셔널
//Implicityl Unwrapped Optional : IUO
let name4: String! = "정현주"
print("제 이름은 \(name4) 입니다")



//함수, closure

func hello(){
    print("world")
}

hello()



func hello2(name: String){
    print("hello \(name)")
}

hello2(name : "hyun")


//underscore 를 대신 별칭을 넣어줄수 있다
func sumValue(_ x:Int ,_ y:Int) -> Int {
    return x + y
}

/*
 외부에서 불리는건 x , 내부에서 불리는건 a
 func sumValue(a x:Int ,b y:Int) -> Int {
 return a + b
 }
 sumValue(x:10, y:20)
*/
sumValue(10,20)


//
func sum(_ values: Int...){
  values
}

sum(1,2)
sum(1,2,10)

func hello2(name : String , time: Int){
    func getMessage(name: String) -> String{
        return "\(name)님 안녕하세요!"
    }
    
    for _ in 0..<time{
        print(getMessage(name: name))
    }
}

hello2(name:"bluehyun" , time:1)



//closuer
func greeter(message: String) ->((String) -> String){
//1st
//    func hello(name: String) -> String{
//        return "\(name)\(message)!"
//    }
//2nd
//    return { (name: String) -> String in
//        return "\(name)\(message)"
//        
//    }
//3th
    return { name in "\(name)\(message)" }
}

print(greeter(message:"님 안녕하세요dydy")("bluehyun"))





/*
let sum2 : (Int, Int) -> Int = { ( x: Int, y: Int) -> Int in
    return x + y
}
*/

let sum2 : (Int, Int) -> Int = { $0 + $1 }


sum2(10,0)


//callback func

func user(id: Int, completion:(String) -> Void){
    //비동기
    completion("bluehyun")
}
//name 의 타입을 user func 에 정의 되어 있음
// return type 또한 정의 되어 있음
// 마지막 파라메터가 클로저의 경우 클로저 명 삭제 가능

user(id:123, completion: { (name:String) -> Void in
    print(name)
})


//0 부터 10까지의 배열
//짝수만 골라서
//곱하기 2를 하고
//그 값을 더하시오

let su:[Int] = [1,2,3,4,5,6,7,8,9,10]



(0...10)
    .filter{$0 % 2 == 0}
    .map{$0 * 2}
    .reduce(0,+)


// array filter , lazy 를 잘 사용하면 반복요소를 줄일수 있다.
// filter 는 배열을 대상으로 반복문을 돌림



let numbers: [Int] = [0, 3, 6, 12, 2, 14, 13]

let value = numbers.lazy
    .filter{$0 == 12}
    .first ?? 0

print(value)

//value 는 옵셔날 타입이 아니라 초기값이 0 인 int 가 됨.
//코드 축약이 무슨 맞춤법 줄임수준일세


//클래스와 구조체

//클래스 는 상속 가능
//슈퍼 클래스를 하나만 가질 수 있다
//참조 타입
class Dog{
    var name : String // stored Property (저장되는 속성)
    var nameCount: Int { // Computed Property(계산되는 속성)
        return name.characters.count
        
        /*
        getter , setter 가 구현되어 있음
        get{
            return _age
        }
        set {
            _age = newValue
        }
        */
    }
    
    init(name: String){
        self.name = name
    }
}

//구조체
//상속 불가 및 슈퍼 클래스를 가질 수 없다
//벨류 타입
struct Cat {
    var name : String
}

let dog1 = Dog(name:"찡코")
let dog2 =  dog1
dog1.name = "멍멍이"
print(dog2.name)

//Value Semantic
var cat1 = Cat(name:"야옹이")
var cat2 = cat1
cat1.name = "냐옹이"

print(cat1.name)
