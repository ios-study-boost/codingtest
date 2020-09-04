import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var anwerCnt = [0,0,0]
    var first = [1,2,3,4,5]
    var second = [2,1,2,3,2,4,2,5]
    var third = [3,3,1,1,2,2,4,4,5,5]
    
    for idx in answers.indices {
        if answers[idx] == first[idx%first.count] {
            anwerCnt[0] += 1
        }
        if answers[idx] == second[idx%second.count] {
            anwerCnt[1] += 1
        }
        if answers[idx] == third[idx%third.count] {
            anwerCnt[2] += 1
        }
    }
    
    var max = anwerCnt.max()
    var ans = [Int]()
    for idx in anwerCnt.indices {
        if anwerCnt[idx] == max {
            ans.append(idx + 1)
        }
    }
    
    return ans
}
