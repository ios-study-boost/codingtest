def solution(n, times):
    left = 0
    right = times[-1]*n
    cnt=0
    answer = 0
    
    while left <= right:
        mid = int((left+right)/2)
        cnt = 0
        for time in times:
            cnt += int(mid/time)

        if cnt >= n: 
            if answer == 0:
                answer = mid
            else:
                answer = min(answer,mid)
            right = mid-1
        elif cnt < n: 
            left = mid+1
            
    return answer