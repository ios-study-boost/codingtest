''' problem - https://programmers.co.kr/learn/courses/30/lessons/49189
    가장 먼 노드
    
    This problem is related with graph
'''

from collections import deque

def solution(n, edge):
    '''Key point - Change vertext to graph with dictionary
                   -> {key: set(value, value), ...}
                   Create node size check nodes initialized with -1
                   Create queue initialized with node 1 and depth 0
                   
                   get node and depth from the queue value by using pop left(Until queue is not existing),
                   check all the depth with linked node in check_node
                        -> depth is -1(not visited), It goes push the queue with depth + 1
    '''
    answer = 0
    graph = dict()

    for node in edge:
        key = node[0]
        value = node[1]
        if key not in graph:
            graph[key] = set()
        
        if value not in graph:
            graph[value] = set()
        graph[key].add(value)
        graph[value].add(key)
    
    queue = deque([[1,0]])
    check_nodes = [-1]*(n+1)
    
    while queue:
        node, depth = queue.popleft()
        check_nodes[node] = depth
        
        for node in graph[node]:
            if check_nodes[node] == -1:
                check_nodes[node] = 0
                queue.append([node, depth+1])
        depth += 1

    return check_nodes.count(max(check_nodes))
