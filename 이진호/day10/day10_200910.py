''' problem - https://programmers.co.kr/learn/courses/30/lessons/42577
    전화번호 목록
    
    This problem is related with hash
'''

def solution(phone_book):
    ''' Key Point - pop the element from phone_book,
                    Check the phone_book includes pop string with 0 index
                    Except same string 
    '''
    cp_list = phone_book.copy()
    while len(phone_book) > 0:
        check = phone_book.pop(0)
        for index in cp_list:
            if index.find(check) == 0 and not check == index:
                return False
    return True