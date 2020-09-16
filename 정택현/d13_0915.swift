// MARK: - 가장 큰 수

import Foundation


func solution(_ numbers:[Int]) -> String {
    var numbers = numbers.map{ String($0) }
    
    // 문자2개를 앞으로 더할지 뒤로 더할지로 정렬
    numbers.sort{ (num1,num2) in
        let pre = num1 + num2
        let suf = num2 + num1
        return pre > suf
    }
    var ans = ""
    for num in numbers {
        ans += num
    }

    if numbers[0] == "0" { return "0" }
    
    
    return ans // numbers.reduce("", +)
}


// 실패 - 시간초과
func solution1(_ numbers:[Int]) -> String {
    
    var answer = ""
    var numberWithIndex = [[Int]]()
    let maxCnt = String(numbers.max()!).count // 제일 큰 수 자리수 구하기
    
     // 1. 자리수를 동일하게 맞춘다
    for idx in numbers.indices {
        var number = numbers[idx]
        // 자리수가 제일 큰 수 보다 작을 때
       if String(number).count < maxCnt {
            let diff = maxCnt - String(number).count
            number = number * Int(pow(10.0,Double(diff)))
        }
        numberWithIndex.append([idx,number])
    }
    
    // 2. 제일 큰 순서로 정렬
    numberWithIndex.sort { $0[1] > $1[1] }
    
    for i in numberWithIndex.indices {
        let index = numberWithIndex[i][0]
        answer += String(numbers[index])
    }
    
    return answer
} 
