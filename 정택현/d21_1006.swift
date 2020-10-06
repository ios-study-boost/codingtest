func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skillOrder = Array(skill)
    var answerCnt = 0
    
    for skilltree in skill_trees{
        var order = 0
        var goodorder = true
        for check in skilltree {
            if skillOrder.contains(check) {
                if check == skillOrder[order] { //스킬 순서대로 배웠는지 체크
                    order += 1
                } else { //스킬트리 안지킴
                    goodorder = false
                    break
                }
                goodorder = true
            }
        }
        if goodorder {
            print(skilltree)
            answerCnt += 1
        }
    }
    
    
    return answerCnt
}
