import collections

def solution(priorities, location):
    answer = 0
    deq = collections.deque([v,i] for i,v in enumerate(priorities))
    
    while len(deq):
        temp = deq.popleft()
        if deq and max(deq)[0]> temp[0]:
            deq.append(temp)
        else:
            answer+=1
            if temp[1] == location:
                break

    return answer