# https://programmers.co.kr/learn/courses/30/lessons/42840
# 모의고사

def solution(answers):
    answer = []
    
    math1 = [1,2,3,4,5]
    math2 = [2,1,2,3,2,4,2,5]
    math3 = [3,3,1,1,2,2,4,4,5,5]
    ans = [0 for i in range(3)]
    
    for a in answers:
        if a == math1[0]:
            ans[0] += 1
        if a == math2[0]:
            ans[1] += 1
        if a == math3[0]:
            ans[2] += 1
        math1.append(math1.pop(0))
        math2.append(math2.pop(0))
        math3.append(math3.pop(0))
    
    m = max(ans)
    for i in range(len(ans)): 
        if ans[i] == m:
            answer.append(i+1)
    
    return answer