''' problem - https://programmers.co.kr/learn/courses/30/lessons/43238
    입국심사
    
    This problem is related with binary search
'''

def solution(n, times):
    '''Key point -  set left from best time and set right from worst time
                    set mid between worst case and best case
                    Check the mid time from support value
                    -> support value is more than n
                        -> set new right from left and set new mid
                    -> support value is lower than n
                        -> set new left from left + 1 and set new mid
                    It checks until left and right value is same   
    '''
    left = min(times)
    right = max(times) * n
    
    while left < right:
        cnt = 0
        mid = (left+right) // 2
        for time in times:
            cnt += mid // time
            
        if cnt >= n:
            right = mid
        else:
            left = mid + 1
    
    return left