#각 키패드를 좌표로 변환하고 절댓값으로 거리를 계산한다
#0과 left,right 초기 좌표에 유의한다.

def solution(numbers, hand):
    answer = ''
    left,right = [1,3],[3,3] 
    pos = {}
    
    for n in numbers:
        if n == 0:
            pos[n] = [2,3]
        else:
            x = n%3 if n%3 != 0 else 3
            y = (n-1) // 3 
            pos[n] = [x,y] 
        
    for n in numbers:
        if n!=0 and n % 3 == 0 :
            answer += "R"
            right = pos[n]
        elif n % 3 == 1:
            answer+= "L"
            left = pos[n]
        else:
            xpos = pos[n] 
            ldist = abs(xpos[0]-left[0])+abs(xpos[1]-left[1])
            rdist = abs(xpos[0]-right[0])+abs(xpos[1]-right[1])
             
            if ldist == rdist :
                if hand == "left":
                    answer+= "L"
                    left = pos[n]
                else:
                    answer+= "R"
                    right = pos[n]
            elif ldist < rdist:
                answer += "L"
                left = pos[n]
            else:
                answer += "R"
                right = pos[n]
                 
            
    return answer