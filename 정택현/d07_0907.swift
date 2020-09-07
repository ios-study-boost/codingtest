import Foundation

// MARK:- 타겟넘버

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    search(numbers: numbers, target: target, depth: 0, value: 0, cnt: &answer)
    return answer
}

func search(numbers: [Int],target: Int, depth: Int, value: Int, cnt: inout Int) {
   
    if depth >= numbers.count {
        if value == target { cnt += 1 }
        return
    }
    search(numbers: numbers, target: target, depth: depth+1, value: value + numbers[depth], cnt: &cnt)
    search(numbers: numbers, target: target, depth: depth+1, value: value - numbers[depth], cnt: &cnt)
}


solution([1,1,1,1,1], 3)

