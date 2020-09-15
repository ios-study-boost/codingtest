import Foundation

// MARK:- 체육복
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var ans = 0
    let reserveExceptLost = reserve.filter {!lost.contains($0)}
    let lost = lost.filter{!reserve.contains($0)}
    var use = [Int]()
    
    ans = n - lost.count
    var borrow = 0
    for idx in lost.indices {
        var lostPerson = lost[idx]
        
        if reserveExceptLost.contains(lostPerson - 1), !use.contains(lostPerson - 1) {
            borrow += 1
            use.append(lostPerson - 1)
        } else if reserveExceptLost.contains(lostPerson + 1), !use.contains(lostPerson + 1) {
            borrow += 1
            use.append(lostPerson + 1)
        }
    }

    
    return ans + borrow
    
}
