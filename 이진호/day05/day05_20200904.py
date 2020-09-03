''' problem - https://programmers.co.kr/learn/courses/30/lessons/42840
    모의고사
    
    This problem is related with Brute-force Search
'''


def solution(answers):
    '''Key point - Check cnt % person's answer length
                   If answer is same as person's answer, point up the person's result
                   Check the largest Int in the result dictionary,
                    -> Append largest key in the first_rank list
                    -> If largest is same as person's result, append first_rank list
                    -> If largest is lower than person's result,
                            -> remove all first_rank list
                            -> Append key to first_rank list
                            -> value is going to be largest
    '''
    cnt = 0
    result = {1:0,2:0,3:0}
    person1 = [1,2,3,4,5]
    person2 = [2,1,2,3,2,4,2,5]
    person3 = [3,3,1,1,2,2,4,4,5,5]

    for answer in answers:
        if answer == person1[cnt%len(person1)]:
            result[1] += 1
        if answer == person2[cnt%len(person2)]:
            result[2] += 1
        if answer == person3[cnt%len(person3)]:
            result[3] += 1
        cnt += 1

    largest = result[1]

    first_rank = []
    for key, value in result.items():
        if largest < value:
            first_rank = []
            first_rank.append(key)
            largest = value
        elif largest == value:
            first_rank.append(key)

    return first_rank
