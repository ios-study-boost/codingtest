// https://programmers.co.kr/learn/courses/30/lessons/42587
// 프린터

import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var answer: Int = 1
    var p: [Int] = priorities
    var l: Int = location

    while !p.isEmpty {
        guard let max = p.max() else {
            break
        }
        
        if p[0] < max {
            p.append(p.removeFirst())
            l = l < 1 ? p.count - 1 : l - 1
        } else {
            if l == 0 {
                return answer
            }
            
            answer += 1
            p.removeFirst()
            l -= 1
        }
        
    }

    return answer
}