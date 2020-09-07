def solution(n, lost, reserve):
    answer = 0
    
    for r in reserve:
        if not lost:
            break
        if r in lost:
            lost.remove(r)
        else:
            for l in lost:
                if l+1 == r or l-1 == r :
                    if l not in reserve:
                        lost.remove(l)
                    break

    answer = n-len(lost)
    return answer