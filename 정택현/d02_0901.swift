import Foundation

// MARK:- Day2 - 프린터

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var ans = 0
    var documents = [(loc: Int, prior: Int)]()
    // (문서번호 , 중요도) 튜플로 저장
    for (loc,prior) in priorities.enumerated() {
        documents.append((loc,prior))
        
    }
    
    while !documents.isEmpty {
        let doc = documents.removeFirst()
        let maxPrior = documents.max { $0.1 < $1.1 } ?? doc // documents가 removefirst 후 empty가 되면 max는 doc
        if doc.prior < maxPrior.prior { // 중요도가 낮음
            documents.append(doc)
        }else { // 중요도 젤 높음 Print
            ans += 1
            if doc.loc == location { return ans}
        }
    }
    
    return 0
}


