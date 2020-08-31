def solution(participant, completion):
    ''' Key Point
        [stanko, mislav, ana]
        change to dictionary form 
        {'mislav': 1, 'stanko': 1, 'ana': 1}
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