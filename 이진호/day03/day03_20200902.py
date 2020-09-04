''' problem - https://programmers.co.kr/learn/courses/30/lessons/42626
    더맵게
    
    This problem is related with heap
'''

import heapq

def solution(scoville, K):
    '''KeyPoint - use heapq
       1. Change list by using heapify
       2. get the smallest number, second smallest number
       3. Get the mixed result and heappush
       4. If smallest number is bigger than K, break
       5. If length is 0, mixed result is lower than K, returns -1
    '''
    answer = 0
    
    heapq.heapify(scoville)
    while True:
        if scoville[0] >= K:
            break
        min1 = heapq.heappop(scoville)
        min2 = heapq.heappop(scoville)
        if len(scoville) == 0 and min1 + (min2 * 2) < K:
            return -1
        heapq.heappush(scoville, min1 + (min2 * 2))
        answer += 1

    return answer