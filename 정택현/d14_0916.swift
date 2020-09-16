// MARK: - 소수 찾기

import Foundation

func solution(_ numbers:String) -> Int {
    var numbers = Array(numbers).map{ Int(String($0))! }
    var answer = 0
    let n = numbers.count
    let numberOfPick = numbers.count
    var store = [[Int]]()
    
    // 순열 1~numbers 갯수 만큼 순열 생성
    for pick in 1...numberOfPick {
        let output : [Int] = Array(repeating: 0, count: pick)
        let visited : [Bool] = Array(repeating: false, count: n)
        permutation(numbers,output,visited,0,n,pick,&store)
    }
    
    numbers = [Int]()
    for p in store { // 순열배열 -> 숫자로 변경후 저장
        let n = Int(p.map { String($0) }.joined())!
        numbers.append(n)
    }
    numbers = Array(Set(numbers)) // 중복제거
    
    // 소수 판별
    for num in numbers {
        if isPime(number: num) {
            answer += 1
        }
    }
    
    
    return answer
}

func isPrime(number: Int) -> Bool {
    var isP = true
    if number < 2 { return false }
    for i in 2..<number {
        if number % i == 0 {
            isP = false
        }
    }
    return isP
}


func permutation(_ arr : [Int],_ output : [Int],_ visited : [Bool],_ depth : Int,_ n : Int,_ r : Int, _ store: inout [[Int]] ){
    var arr = arr
    var output = output
    var visited = visited
    
    if depth == r {
        store.append(output)
        return
    }
    for i in 0..<n {
        if visited[i] != true {
            visited[i] = true
            output[depth] = arr[i]
            permutation(arr,output,visited,depth + 1,n,r, &store)
            output[depth] = 0
            visited[i] = false
        }
    }
}


r
