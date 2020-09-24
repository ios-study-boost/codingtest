// MARK: - 문자열 압축

import Foundation

func solution(_ s:String) -> Int {
    var answer = [Int]() // 문자열 자른 갯수별 카운트
    if s.count == 1 { return 1 }
    
    for splictCnt in 1...s.count/2 {
        var compress = [String]()
        let splictString = s.components(withMaxLength: splictCnt)
        var stack = [String]()
        
        for idx in 0..<splictString.count {
            if stack.isEmpty {
                stack.append(splictString[idx])
            } else {
                // 이전과 같을때 다를떼
                if stack[0] == splictString[idx] {
                    stack.append(splictString[idx])
                } else {
                    let comp = stack.count > 1 ? "\(stack.count)\(stack[0])" : stack[0]
                    compress.append(com)
                    stack = [String]()
                    stack.append(splictString[idx])
                }
            }
            if idx == splictString.count - 1  {
                let comp = stack.count > 1 ? "\(stack.count)\(stack[0])" : stack[0]
                compress.append(comp)
            }
        }
        answer.append(compress.joined().count)
    }
    
    return answer.min()!
}


// 문자열 갯수로 자르기
extension String {
    func components(withMaxLength length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}
