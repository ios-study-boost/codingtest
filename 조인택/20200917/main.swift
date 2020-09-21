//
//  main.swift
//  MakeBigger
//
//  Created by In Taek Cho on 2020-09-17.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var copiedK = k
    let copiedNumberArr = number.map { Int(String($0))! }
    var stack = [Int]()
    
    for index in 0..<copiedNumberArr.count {
        while stack.count != 0 && stack[stack.count - 1] < copiedNumberArr[index] && copiedK != 0{
            stack.removeLast()
            copiedK -= 1
        }
        
        if copiedK == 0 {
            stack += copiedNumberArr[index..<copiedNumberArr.count]
            break
        } else {
            stack.append(copiedNumberArr[index])
        }
    }
    
    return stack.map({ String($0) })[0..<(number.count - k)].reduce("", { $0 + $1 })
}
