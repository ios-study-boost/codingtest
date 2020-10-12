
// MARK: - 올바른 괄호
// https://programmers.co.kr/learn/courses/30/lessons/12909

import Foundation

func solution(_ s:String) -> Bool
{
    var stack = [Character]()
    for char in s {
        switch char {
        case "(":
            stack.append(char)
        case ")":
            if stack.isEmpty || stack.removeLast() != "(" {
                return false
            }
        default:
            break
        }
    }
    return stack.isEmpty
}


// MARK: - 최소값 만들기
// https://programmers.co.kr/learn/courses/30/lessons/12941

import Foundation

func solution1(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    let a = A.sorted{ $0 > $1 }
    let b = B.sorted{ $0 < $1 }
    
    // a - max , b - min
    for idx in 0..<a.count {
        ans += (a[idx]*b[idx])
    }
    
    return ans
}


