''' problem - https://programmers.co.kr/learn/courses/30/lessons/42862
    체육복
    
    This problem is related with greedy
'''


def solution(n, lost, reserve):
    '''Key point - Create list with n size with 1
                   Subtraction 1 in lost index
                   Add 1 in reserve index
                   Find 0 index and check front and back with over 1 value
    '''
    student = list()
    
    for _ in range(n):
        student.append(1)
    
    for i in lost:
        student[i-1] -= 1
        
    for i in reserve:
        student[i-1] += 1
    
    
    for index in range(len(student)):
        if student[index] == 0 and index == 0:
            if student[index+1] > 1:
                student[index+1] -= 1
                student[index] = 1
        elif student[index] == 0 and index == n-1:
            if student[index-1] > 1:
                student[index-1] -= 1
                student[index] = 1
        else:
            if student[index] == 0 and student[index+1] > 1:
                student[index+1] -= 1
                student[index] = 1
            elif student[index] == 0 and student[index-1] > 1:
                student[index-1] -= 1
                student[index] = 1
    answer = 0
    for i in student:
        if i > 0:
            answer += 1
        
    return answer


def solution(n, lost, reserve):
    '''Key point - Set _lost list with not including reserve value
                   Set _reserve list with not including lost value
                   Check all the _lost element's front and back value in the _reserve list
                   If exists remove value in the _reserve list
    '''
    
    _lost = [ r for r in lost if r not in reserve]
    _reserve = [r for r in reserve if r not in lost]
    
    result = n - len(_lost)
    
    for lost in _lost:
        
        front = lost - 1
        back = lost + 1
        
        if front in _reserve:
            result += 1
            _reserve.remove(front)
        
        elif back in _reserve:
            result += 1
            _reserve.remove(back)

    return result