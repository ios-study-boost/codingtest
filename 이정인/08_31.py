  answer = ''
    participant.sort()
    completion.sort()
    cnt = 1
    
    if participant[0] != completion[0]:
        return participant[0]
    else:
        while cnt< len(completion):
            if participant[cnt] != completion[cnt]:
                answer = participant[cnt]
                break
            else:
                cnt+=1
        if answer=='':
            answer = participant[-1]
        return answer
        
