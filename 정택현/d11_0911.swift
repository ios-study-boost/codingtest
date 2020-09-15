// MARK: - 기능개발

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var works = progresses
    var speeds = speeds
    var ansArr = [Int]()
    while !works.isEmpty {
        for idx in works.indices {
            works[idx] = works[idx] + speeds[idx]
        }
        
        var cnt = 0
        if works[0] >= 100 {
            var chk = true
            for work in works {
                if !chk { break }
                if work >= 100 { cnt += 1 }
                else { chk = false }
            }
        

            for _ in 0..<cnt {
                works.removeFirst()
                speeds.removeFirst()
            }
            ansArr.append(cnt)
        }
    
    }
    return ansArr
}




