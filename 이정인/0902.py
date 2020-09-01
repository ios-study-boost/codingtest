import heapq

def solution(scoville, K):
    answer = 0
    heapq.heapify(scoville)
    v1 = 0
    v2 = 0
    result = 0
    
    while scoville:
        v1 = heapq.heappop(scoville)  
        if not scoville:
            answer = -1
            break
        v2 = heapq.heappop(scoville)
        result = v1 + v2*2 
        heapq.heappush(scoville,result)   
        answer+=1
        
        if scoville[0]>=K:
            break
    return answer