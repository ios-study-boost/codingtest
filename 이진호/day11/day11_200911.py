''' problem - https://programmers.co.kr/learn/courses/30/lessons/42586
    기능 개발
    
    This problem is related with stack
'''


def solution(progresses, speeds):
    ''' Key point - Add each speed to the progresses until progresses is not exists
                    Check first element over the 100,
                        -> If element is over the 100, cnt + 1
                        -> else break
                    
                    If cnt is more than 0, pop with cnt times
                    Append to the answer
    '''
    answer = []
    
    while len(progresses) > 0:
        cnt = 0
        for index in range(len(progresses)):
            progresses[index] += speeds[index]
        for progress in progresses:
            if progress < 100:
                break
            if progress >= 100:
                cnt += 1
        if cnt > 0:
            for _ in range(cnt):
                progresses.pop(0)
                speeds.pop(0)
            answer.append(cnt)
    return answer