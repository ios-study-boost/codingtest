# https://programmers.co.kr/learn/courses/30/lessons/42862
# 체육복

def solution(n, lost, reserve):
    answer = n
    
    same = list(set(lost) & set(reserve))
    lost = list(set(lost) - set(same))
    reserve = list(set(reserve) - set(same))
    
    i = 0
    while i < len(lost):
        front = lost[i] - 1
        back = lost[i] + 1
        if front in reserve:
            reserve.pop(reserve.index(front))
            lost.pop(i)
        elif back in reserve:
            reserve.pop(reserve.index(back))
            lost.pop(i)
        else:
            i += 1
                    
    return answer - len(lost)