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

print(optionalEmail)
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

