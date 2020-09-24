import Foundation
//n편 중, 
//h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 
//h의 최댓값이 이 과학자의 H-Index입니다.
func solution(_ citations:[Int]) -> Int {
    var papers = citations
    papers.sort()
    var h = 0
    guard let maxCit = citations.max() else{
        return 0
    }
    if maxCit == 0{
        return 0
    }
    for perdictH in 1...maxCit{
        var upCit = papers.filter({$0 >= perdictH}).count
        var downCit = papers.filter({$0 < perdictH}).count
        
        print(perdictH,upCit,downCit)
        if perdictH <= upCit {
            if perdictH >= downCit {
                h = perdictH
            }
        }
    }
    return h
}
