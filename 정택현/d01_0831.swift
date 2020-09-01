import Foundation

// MARK:- 완주하지 못한 선수

var participants = ["mislav", "stanko", "mislav", "ana"]
var completions = ["stanko", "ana", "mislav"]

func solution(participant: [String], completion: [String]) -> String {
    var ans = ""
    var dic = [String: Int]()
    
    for p in participant {
        dic[p] = (dic[p] ?? 0 ) + 1
    }
    
    for c in completion {
        dic[c] = (dic[c] ?? 0) - 1
    }
    
    dic.forEach{ key,value in
        if value > 0 { ans += key; ans += " "}
    }
    
    return ans
}

print(solution(participant: participants, completion: completions))

