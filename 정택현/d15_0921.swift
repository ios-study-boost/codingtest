// MARK: - 다리를 지나는 트럭

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var passTruck = [Int]()
    var waitingTruck = truck_weights
    var truckInBridge = [Int]()
    var timeInBridge = [Int]()
    var timePass = 0
    
    while passTruck.count != truck_weights.count {
        
        // 트럭 다리 건넘
        if !timeInBridge.isEmpty , timeInBridge[0] >= bridge_length {
            timeInBridge.removeFirst()
            passTruck.append(truckInBridge.removeFirst())
        }
        
        // 차가 지나가고 무게 체크
        let weightAll = truckInBridge.reduce(0, +)
        
        // 차량 무게 견딜때 차가 한대만 들어옴
        if !waitingTruck.isEmpty , weightAll + waitingTruck[0] <= weight{
            truckInBridge.append(waitingTruck.removeFirst())
            timeInBridge.append(0)
        }
        
        timePass += 1
        timeInBridge = timeInBridge.map { $0 + 1 }
    }
    
    return timePass
}
