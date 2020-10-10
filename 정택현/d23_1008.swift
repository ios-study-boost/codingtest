// MARK: - 짝지어 제거하기

import Foundation

func solution(_ s:String) -> Int{
    var stack = [String]()
    
    for char in s {
        if stack.isEmpty { stack.append(String(char)) }
        else {
            let beforeChar = stack.last!
            if String(char) == beforeChar {
                stack.popLast()
            }else {
                stack.append(String(char))
            }
        }
    }
    return stack.isEmpty ? 1 : 0
}

