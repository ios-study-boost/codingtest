# https://programmers.co.kr/learn/courses/30/lessons/42587
# 프린터

def solution(priorities, location):
    answer = 1

    while priorities:
        if priorities[0] < max(priorities):
            priorities.append(priorities.pop(0))
            # location이 -가 되면 = 가장 뒤로 갔다는 걸 삼항연산자로 계산하여 처리함
            location = location < 1 and len(priorities) - 1 or location - 1
        else: # 현재 값이 우선순위가 가장 높은 경우
            if location == 0:
                return answer
            
            answer += 1
            priorities.pop(0)
            location -= 1
    
    return answer