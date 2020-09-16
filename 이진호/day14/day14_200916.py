''' problem - https://programmers.co.kr/learn/courses/30/lessons/42839
    소수 찾기
    
    This problem is related with Brute-force Search
'''

import itertools

def prime_number(number):
    ''' check prime number
    '''
    if number == 0:
        return False
    if number != 1:                 
        for f in range(2, number):  
            if number % f == 0:     
                return False
    else:
        return False
    return True

def solution(numbers):
    ''' Key point - Create all string cases by using itertools.permutation
                    Change int in the result_numbers and modifying set
                    Check the prime number in the result_numbers
    '''
    result_numbers = list()
    list_numbers = list(numbers)
    n = 1
    for _ in range(len(list_numbers)):
        new_list = list(map(''.join, itertools.permutations(list_numbers, n)))
        n += 1
        result_numbers.extend(new_list)
        
    result_numbers = set(list(map(int, result_numbers)))
    cnt = 0
    for number in result_numbers:
        if prime_number(number):
            cnt += 1
    return cnt