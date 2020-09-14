''' problem - https://programmers.co.kr/learn/courses/30/lessons/42627
    디스크 컨트롤러
    
    This problem is related with heap
'''


import heapq

def solution(jobs):
    ''' Key point - set current time and last time
                    It runs until add all job time to answer
                        -> If job start time is between last time and current time,
                            It adds to answer with current time - job start time
                            And add to heap named task
                        -> If task is not empty
                            It adds first task time in the heap to answer with number of task 
                            last time is set by current time
                            current time is set by popped task
                        -> Else
                            +1 current time               
    '''
    task = []
    answer = 0
    cur_time = 0
    last_time = -1
    cnt = 0
    while cnt < len(jobs):
        for job in jobs:
            if last_time < job[0] <= cur_time:
                answer += cur_time - job[0]
                heapq.heappush(task, job[1])
                
        if len(task) > 0:
            answer +=len(task)*task[0]
            last_time = cur_time
            cur_time += heapq.heappop(task)
            cnt += 1
        else:
            cur_time += 1
    return answer // len(jobs)