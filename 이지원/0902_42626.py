import heapq

def solution(scoville, K):
    answer = 0
    heap = []
    
    for s in scoville:
        heapq.heappush(heap, s)
    
    if max(heap) < 1:
        return -1

    while len(heap) > 1 and heap[0] <= K:
        first = heapq.heappop(heap)
        second = heapq.heappop(heap)
        mix = first + (second * 2)
        heapq.heappush(heap, mix)
        answer += 1
        
    return heap[0] <= K and -1 or answer