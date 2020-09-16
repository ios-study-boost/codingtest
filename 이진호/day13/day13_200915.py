''' problem - https://programmers.co.kr/learn/courses/30/lessons/42627
    가장 큰 수
    
    This problem is related with sort
'''


def quick_sort(arr):
    ''' Key point - Compare the list element + pivot or pivot + element
                    Sorting with quick sort
    '''
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    lesser_arr, equal_arr, greater_arr = [], [], []
    for num in arr:
        if num + pivot > pivot + num:
            lesser_arr.append(num)
        elif num + pivot < pivot + num:
            greater_arr.append(num)
        else:
            equal_arr.append(num)
    return quick_sort(lesser_arr) + equal_arr + quick_sort(greater_arr)


def solution(numbers):
    ''' Key point - Change int list to string list and call the custom quick sort
    '''
    numbers.sort(reverse= True)
    str_numbers = list(map(str, numbers))
    a = quick_sort(str_numbers)

    return str(int(''.join(a)))