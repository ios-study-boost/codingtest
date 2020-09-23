//
//  main.swift
//  ExpressByN
//
//  Created by In Taek Cho on 2020-09-18.
//

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number {
        return 1
    }
    
    var set = Set<Int>()
    set.insert(N)

    return work([set], N, number)
}

func work(_ arr: [Set<Int>], _ N: Int, _ number: Int) -> Int {
    var copiedArr = arr
    
    if copiedArr.count > 8 {
        return -1
    }
    
    guard let lastOne = copiedArr.last else {
        return -1
    }
    
    if lastOne.contains(number) {
        return copiedArr.count
    }
    
    var newSet = Set<Int>()
    for index1 in 0..<copiedArr.count {
        for num1 in copiedArr[index1] {
            for num2 in copiedArr[copiedArr.count - index1 - 1] {
                newSet.insert(num1 + num2)
                newSet.insert(num1 - num2)
                if num2 != 0 {
                    newSet.insert(num1 / num2)
                }
                newSet.insert(num1 * num2)
            }
        }
    }
    newSet.insert(Int(String(repeating: String(N), count: copiedArr.count + 1))!)
    copiedArr.append(newSet)
    
    return work(copiedArr, N, number)
}


//
//print(solution(5, 12))
//print(solution(5, 31168))
//print(solution(2, 11))

