import collections
def solution(phone_book):
    answer = True
    phone_book.sort()
    slideIdx = len(phone_book[0])
    dict  = {phone_book[0]:0}
    
    for p in phone_book:
        key = p[0:slideIdx]
        if phone_book[0] == key: 
            dict[key]+=1
            if dict[key] > 1:
                return False
    
    
    return answer