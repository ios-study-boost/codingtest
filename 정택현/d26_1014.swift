
// MARK: - 뉴스 클러스터링
// https://programmers.co.kr/learn/courses/30/lessons/17677

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    let set1 = str1.getMultiSet()
    let set2 = str2.getMultiSet()

    var set1Dic = [String:Int]()
    var set2Dic = [String:Int]()
    
    for str in set1 {
        if set1Dic[str] == nil { set1Dic[str] = 1; continue }
        set1Dic[str] = set1Dic[str]! + 1
    }
    
    for str in set2 {
        if set2Dic[str] == nil { set2Dic[str] = 1; continue }
        set2Dic[str] = set2Dic[str]! + 1
    }
    
    // 서로 같은 문자열
    let interSection = Set(set1).intersection(Set(set2))
    let union = Set(set1).symmetricDifference(Set(set2))
    
    var inter = [String]()
    var sum = [String]()
    
    for str in interSection {
        guard let num1 = set1Dic[str], let num2 = set2Dic[str] else  { break }
        let mn = min(num1, num2)
        let mx = max(num1,num2)
        inter += Array(repeating: str, count: mn)
        sum += Array(repeating: str, count: mx)
    }
    
    for str in union {
        if set1Dic[str] == nil {
            sum += Array(repeating: str, count: set2Dic[str]!)
        } else {
            sum += Array(repeating: str, count: set1Dic[str]!)
        }
    }
    
    if inter.isEmpty && sum.isEmpty {
        return 65536
    }
    let jakad = Double(inter.count) / Double(sum.count)
    
    
    return Int(jakad * 65536)
}

extension String {
    func getMultiSet() -> [String] {
        let str = Array(self).map{String($0.lowercased())}
        var set = [String]()
        var beforeIdx: Int?
        let alpha = Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
        
        for currIdx in str.indices{
            guard let before = beforeIdx else {
                beforeIdx = currIdx
                continue
            }
            let word = str[before...currIdx]
       
            // 특수문자 제거
            if word.filter({ !alpha.contains($0) }).isEmpty  {
                set.append(word.joined())
            }
            
            beforeIdx = currIdx
        }
    
        return set
    }
}



// MARK: - jaden case
// https://programmers.co.kr/learn/courses/30/lessons/12951
import Foundation

func solution(_ s:String) -> String {
    
    var str = Array(s).map{String($0.lowercased())}
    var blank: Bool? = true
    let alpha = Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
    
    for idx in 0..<str.count {
        if str[idx] == " " {
            blank = true
            continue
        }
        if blank == nil { continue }
        if blank! {
            if alpha.contains(str[idx]) {
                str[idx] = str[idx].uppercased()
            }
            blank = nil
        }
        
    }
    
    return str.joined()
}
