# https://programmers.co.kr/learn/courses/30/lessons/42576
# 완주하지 못한 선수

def solution(participant, completion):
    answer = ''
    dict = {}
    
    for p in participant:
        dict[p] = dict.get(p, 0) + 1
    
    for c in completion:
        dict[c] -= 1
        
    for key, value in dict.items():
        if value == 1:
            answer = key
            break
        
    return answer