import Foundation

// MARK:- Day4 - K번째 수

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int]  {
    // 1. slice
    // 2. 정렬 -> K값 찾기
    var ans = [Int]()
    for command in commands {
        let i = command[0] - 1 ; let j = command[1] - 1 ; let k = command[2] - 1
        var slice = Array(array[i...j])
        slice.sort()
        ans.append(slice[k])
    }
    print(ans)
    return ans
}
