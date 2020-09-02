# https://programmers.co.kr/learn/courses/30/lessons/42626
# 더 맵게

import heapq

def solution(scoville, K):
    answer = 0
    heap = []
    
    for s in scoville:
        heapq.heappush(heap, s)

    while len(heap) > 1 and heap[0] <= K:
        first = heapq.heappop(heap)
        second = heapq.heappop(heap)
        mix = first + (second * 2)
        heapq.heappush(heap, mix)
        answer += 1
        
    return heap[0] <= K and -1 or answer