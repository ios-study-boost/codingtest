// MARK: - 수식 최대화

import Foundation

func solution(_ expression:String) -> Int64 {
    
    var sum = [Int64]()
    // 숫자 합치기
    var expr = [String]()
    var str = ""
    for (idx,char) in expression.enumerated() {
        switch char {
        case "+","*","-":
            expr += [str,String(char)]
            str = ""
        default:
            str.append(char)
        }
        if idx == expression.count-1 {
            expr += [str]
        }
    }
    
    
    
    var order = [["*","+","-"],["*","-","+"],["+","*","-"],["+","-","*"],["-","+","*"],["-","*","+"]]
    while !order.isEmpty{
        var ex = expr
        var prior = order.first!
        while !prior.isEmpty {
            
            guard let op = prior.first else { break }
           guard let idx = ex.firstIndex(of: op) else {
                prior.removeFirst()
                continue
            }
            
            let subcalc = ex[idx-1...idx+1].map{String($0)}.calc()
            ex.removeSubrange(idx-1...idx+1)
            ex.insert(subcalc, at: idx-1)
        }
        order.removeFirst()
        let num = Int64(ex.joined())!
        
        if num < 0 {
            sum.append(-num)
        }else {
            sum.append(num)
        }
    }

    return sum.max()!
}

extension Array where Element == String {
    func calc() -> String {
        let arr = self
        let num1 = Int(arr.first!)!
        let num2 = Int(arr.last!)!
        
        switch arr[1] {
        case "*":
            return String(num1*num2)
        case "-":
            return String(num1-num2)
        case "+":
            return String(num1+num2)
            
        default:
            return ""
        }
        
    }
}
 
