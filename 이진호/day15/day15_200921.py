''' problem - https://programmers.co.kr/learn/courses/30/lessons/42583
    다리를 지나는 트럭
    
    This problem is related with stack/queue
'''

def solution(bridge_length, weight, truck_weights):
    ''' Key point - Create bride queue with bridge length
                    Check first element of brigde weight and sum of bridge
                        -> If lower, append bridge queue
                        -> If higher, append 0
    '''
    time = 0
    bridge = [0] * bridge_length
    
    while bridge:
        time += 1
        bridge.pop(0)
        if truck_weights:
            if sum(bridge) + truck_weights[0] <= weight:
                bridge.append(truck_weights.pop(0))
            else:
                bridge.append(0)
    return time