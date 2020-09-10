# https://programmers.co.kr/learn/courses/30/lessons/42577
# 전화번호 목록
def solution(phone_book):
    for p in range(len(phone_book)):
        for j in range(len(phone_book)):
            if p != j and phone_book[j][:len(phone_book[p])] == phone_book[p]:
                return False
    return True