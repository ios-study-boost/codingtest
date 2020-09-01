''' problem - https://programmers.co.kr/learn/courses/30/lessons/42587
    프린터
    
    This problem is related with stack and queue
'''

def solution(priorities, location):
    '''Key point: get max from the priorities, compare the first element of the list
    -> First element is largest number, it goes remove from the list.
        -> First element is location, end the loop.
    -> First element is not largest number, it goes to to end of the list.
        -> First element is location, location goes to end of the list.
    '''

    key = priorities[location]
    result = 0
    while True:
        max_number = max(priorities)
        if key == max_number and location == 0:
            result += 1
            break
        if priorities[0] == max_number:
            priorities.remove(priorities[0])
            location -= 1
            result += 1
        elif location == 0 and key < max_number:
            priorities.append(priorities.pop(0))
            location = len(priorities) - 1 
        elif location > 0 and priorities[0] <= max_number:
            priorities.append(priorities.pop(0))
            location -= 1

    return result