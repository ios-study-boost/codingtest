from collections import deque

def solution(n, edge):
    routes = dict()
    for e1, e2 in edge:
        routes.setdefault(e1, []).append(e2)
        routes.setdefault(e2, []).append(e1)
        
    q = deque([[1, 0]]) # node number, depth
    check = [-1]*(n+1)
    while q:
        index, depth = q.popleft()
        check[index] = depth
        for i in routes[index]:
            if check[i]==-1:
                check[i] = 0
                q.append([i, depth+1])
        depth += 1
    return check.count(max(check))