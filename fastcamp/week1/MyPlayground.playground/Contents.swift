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





