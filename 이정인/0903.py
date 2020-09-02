def solution(array, commands):
    answer = []
    temp = []
    for c in commands:
        temp = array[c[0]-1:c[1]]
        temp.sort()
        answer.append(temp[c[2]-1])
    return answer