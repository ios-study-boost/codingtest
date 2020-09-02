''' problem - https://programmers.co.kr/learn/courses/30/lessons/42748
    K번째수
    
    This problem is related with array
'''

def solution(array, commands):
    '''Key point - [split] array[start_index - 1 : end_index]
    '''
    answer = []
    for list in commands:
        arr = array[list[0]-1:list[1]]
        arr.sort()
        answer.append(arr[list[2]-1])
    return answer



def solution(array, commands):
    '''Using lamda, it can be shorten the code
    '''
    answer = []
    return list(map(lambda x:sorted(array[x[0]-1:x[1]])[x[2]-1], commands))
