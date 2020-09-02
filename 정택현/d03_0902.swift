import Foundation

// MARK:- Day3 - 더 맵게

func solution(scoville: [Int], k: Int) -> Int{
    var ans = 0
    var mySco = Heap(sort: < , elements: scoville)
    
    while true {
        if mySco.count < 2 { return -1 }
        let first = mySco.remove()!
        let second = mySco.remove()!
        mySco.insert(first + (second * 2 ))
        
        ans += 1
        let check = mySco.remove()!
        if check >= k { return ans }
        else { mySco.insert(check) }
        
    }
    
    return ans
}

struct Heap<Element: Equatable> {
    
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    
    
    init (sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    func peek() -> Element? { // elements가 empty이면 nil
        return elements.first
    }
    
    func rightChildIdx(ofParentAt idx: Int) -> Int {
        return (2*idx) + 2
    }
    
    func leftChildIdx(ofParentAt idx: Int) -> Int {
        return (2*idx) + 1
    }
    
    func parentIdx(ofChildAt idx: Int) -> Int {
        return (idx - 1)/2
    }
    
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count-1) // 루트 노드와 마지막 노드 swap
        defer { // return 후에 실행됨
            siftDown(from: 0) //
        }
        return elements.removeLast()
    }
    
    mutating func siftDown(from idx: Int) {
        var parent = idx
        
        while true {
            let left = leftChildIdx(ofParentAt: parent)
            let right = rightChildIdx(ofParentAt: parent)
            var candidate = parent
            
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent { return }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from idx: Int) {
        var child = idx
        var parent = parentIdx(ofChildAt: child)
        while child > 0 && sort(elements[child],elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIdx(ofChildAt: child)
        }
    }
    
    // 특정 값 제거
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil 
        }
        if index == elements.count - 1 {
            return elements.removeLast() 
        } else {
            elements.swapAt(index, elements.count - 1) 
            defer {
                siftDown(from: index) 
                siftUp(from: index)
            }
            return elements.removeLast() 
        }
    }
    
}
