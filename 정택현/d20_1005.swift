// MARK: - 괄호 변환

import Foundation

func solution(_ p:String) -> String {
    
    if chkBracket(p: p) { return p }
    
    func rec(_ str: String) -> String {
        var ans = ""
        if str.isEmpty { return "" }
        var uv = divide(p: str)
        if chkBracket(p: uv.u) {
            return uv.u + rec(uv.v)
        }
        
        ans = "(" + rec(uv.v) + ")"
        uv.u.removeFirst()
        uv.u.removeLast()
        for char in uv.u {
            if char == "(" { ans.append(")") }
            else { ans.append("(") }
        }
        
        return ans
    }
    let ans = rec(p)
    return ans
}

func chkBracket(p: String) -> Bool {
    var stack = [Character]()
    for char in p {
        switch char {
        case "(":
           stack.append(char)
        case ")":
            if stack.isEmpty || stack.removeLast() != "(" {
                return false
            }
        default:
            break
        }
    }
    return stack.isEmpty
}

func divide(p: String) -> (u:String, v: String) {
    let p = Array(p).map{String($0)}
    var cnt = 0
    var u = ""
    var v = ""
    if p.isEmpty { return (u,v) }
    for (idx,char) in p.enumerated() {
        u.append(char)
        if char == "(" { cnt += 1 }
        else { cnt -= 1 }
        
        if cnt == 0 {
            v = p[idx...].joined()
            break
        }
    }
    v.removeFirst()
    return (u,v)
    
}
 
