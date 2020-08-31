def solution(participant, completion):
    # 효율성 실패
    # 해시 사용하지 않음
    # for i in completion:
    #     participant.remove(i)
    # answer = participant[0]
    # return answer

    participant.sort()
    completion.sort()

    for i in range(0,len(completion)):
        if completion[i] != participant[i]:
            return participant[i]
