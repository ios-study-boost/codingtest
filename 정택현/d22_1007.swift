// MARK: - 튜플

import Foundation

func solution(_ s:String) -> [Int] {
    var ans = [Int]()
    var str = s
    str.removeFirst()
    str.removeLast()
    
    var arr = str.components(separatedBy: ["{","}"])
    arr = arr.filter { $0 != "" && $0 != ","}
    arr.sort { $0.count < $1.count }
    
    
    for tuple in arr {
        var convert = tuple.split(separator: ",").map{ Int(String($0))! }

        for number in ans {
            if convert.contains(number) {
                guard let idx = convert.firstIndex(of: number) else { continue }
                convert.remove(at: idx)
            }
        }
        
        ans.append(convert.removeFirst())
        
    }

    return ans
}
