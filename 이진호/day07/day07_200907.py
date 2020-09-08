''' problem - https://programmers.co.kr/learn/courses/30/lessons/43165
    타겟 넘버
    
    This problem is related with DFS/BFS
'''

#problem solving#1 dfs stack
def solution(numbers, target):
    ''' Key point - using stack, all the case checking
        Pop the value and push the all result + value and all result - value
        Count target in the same result value
    '''
    results = [0]
    cnt = 0
    
    for number in numbers:
        stack = []
        for _ in range(len(results)):
            pop = results.pop()
            stack.append(pop+number)
            stack.append(pop-number)
        results = stack

    for result in results:
        if target == result:
            cnt += 1
    
    return cnt

#problem solving#2 dfs recursive
def dfs(numbers, target):
    ''' Key point - using recursive, all the case checking
        -> Target is 0 and numbers length is 0 it returns 1
        -> Target is not 0 and numbers length is 0 it return 0
        -> Recall the function with first target - value and target + value with popped numbers array
    '''
    cp_num = numbers.copy()
    if target == 0 and len(numbers) == 0:
        return 1
    elif len(numbers) == 0:
        return 0
    else:
        pop = cp_num.pop(0)
        return dfs(cp_num, target-pop) + dfs(cp_num, target+pop)

def solution(numbers, target):
    return dfs(numbers, target)