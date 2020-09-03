def solution(answers):
    answer = []
    score = [0,0,0]
    p1 = [1,2,3,4,5]
    p2 = [2,1,2,3,2,4,2,5]
    p3 = [3,3,1,1,2,2,4,4,5,5]
    
 
    for i,v in enumerate(answers):
        if p1[i%5] == v :
            score[0] +=1
        if p2[i%8] == v :
            score[1] += 1
        if p3[i%10] == v:
            score[2] += 1
            
    
    for i,s in enumerate(score):
        if s == max(score):
            answer.append(i+1)
    
    return answer