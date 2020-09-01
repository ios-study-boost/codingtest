''' problem - https://programmers.co.kr/learn/courses/30/lessons/42576
    완주하지 못한 선수
    
    This problem is related with hash
'''

def solution(participant, completion):
    ''' Key Point
        [stanko, mislav, ana]
        Change to dictionary form 
        {'mislav': 1, 'stanko': 1, 'ana': 1}
        Checking each participant elements in the completion dictionaries key
        If key is empty or value is 0
        It append to result list
    '''
    result = list()
    dict_completion = collections.Counter(completion)
    
    for var in participant:
        if dict_completion[var]:
            dict_completion[var] -= 1
        else:
            result.append(var)

    answer = result[0]
    return answer