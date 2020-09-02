import heapq

def solution(scoville, K):
    answer = 0
    mySco = scoville
    heapq.heapify(mySco)
    for i in range(len(scoville)):
       
        if len(mySco) < 2 :
            return -1
        first = heapq.heappop(mySco)
        second = heapq.heappop(mySco)
        heapq.heappush(mySco,first + (second*2))
        answer += 1
        check = heapq.heappop(mySco) 
        if check >= K:
            return answer
        else:
            heapq.heappush(mySco,check)
        
    
    
    return answer

