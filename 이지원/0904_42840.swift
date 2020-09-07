// https://programmers.co.kr/learn/courses/30/lessons/42840
// 모의고사

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var answer: [Int] = []
    var math1 = [1, 2, 3, 4, 5]
    var math2 = [2,1,2,3,2,4,2,5]
    var math3 = [3,3,1,1,2,2,4,4,5,5]
    var ans = Array(repeating: 0, count: 3)
    
    for a in answers {
        if math1[0] == a { ans[0] += 1 }
        if math2[0] == a { ans[1] += 1 }
        if math3[0] == a { ans[2] += 1 }
        math1.append(math1.removeFirst())
        math2.append(math2.removeFirst())
        math3.append(math3.removeFirst())
    }
    
    let m = ans.max()
    for a in 0..<ans.count {
        if ans[a] == m {
            answer.append(a+1)
        }
    }

    return answer
}