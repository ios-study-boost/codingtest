''' problem - https://programmers.co.kr/learn/courses/30/lessons/62048
    멀쩡한 사각형
    
    This problem is related with math
'''
import math

def solution(w,h):
    ''' Key point - using gcd
                        -> if gcd is 1, width + height - 1 is not available
                        -> If gcd is more than 1, width + height - gcd is not available
    '''
    answer = 1
    if w == h:
        return w*h - w
    gcd = math.gcd(w,h)
    if gcd == 1:
        return w*h - (w + h - 1)
    elif gcd > 1:
        return w*h - (w + h - gcd)

    return answer
