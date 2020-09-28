func solution(_ clothes:[[String]]) -> Int {
    
    var dic = [String:[String]]()
    var clothKind = [String]()
    var answer = 1
    
    // ["eyewear": ["blue_sunglasses"], "headgear": ["yellow_hat", "green_turban"]]
    // 의상의 종류 - key  , 의상 이름 value
    for cloth in clothes {
        if dic[cloth[1]] == nil {
            dic[cloth[1]] = [String]()
        }
        dic[cloth[1]]?.append(cloth[0])
        clothKind.append(cloth[1])
    }
    
    // 모든 조합 = (glass 갯수 + 1) * (hat + 1) .... - 1
    // +1 - 사용하지 않는 경우
    // -1 모두다 착용하지 않는 경우의수 빼주기
    for kind in dic {
        answer *= (kind.value.count+1)
    }
    
    return answer - 1
}

