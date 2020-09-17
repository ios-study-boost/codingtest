//
//  main.swift
//  FindPrime
//
//  Created by In Taek Cho on 2020-09-16.
//  Copyright © 2020 dlsxor21c. All rights reserved.
//

import Foundation

func solution(_ numbers:String) -> Int {
    var result = 0
    
    let numArr = Set(numbers.makePermutation())
    
    for num in numArr {
        if num.checkPrime() {
            result += 1
        }
    }
    return result
}

extension Int {
    func checkPrime() -> Bool {
        if self == 0 || self == 1 {
            return false
        }
        
        if self == 2 || self == 3{
            return true
        }
        
        for i in 2...Int(sqrt(Double(self))) {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}

extension String {
    func makePermutation() -> [Int] {
        var info: [String:Int] = [:]
        var result: [String] = []
        
        for c in self {
            result.append(String(c))
            if let _ = info[String(c)] {
                info[String(c)]! += 1
            } else {
                info[String(c)] = 1
            }
        }
        
        var initial = result
        for _ in 0..<Int(self)! {
            var temp = Set<String>()
            for num in initial {
                for c in self {
                    for index in 0..<num.count {
                        var copiedNum = num
                        copiedNum.insert(c, at: copiedNum.index(copiedNum.startIndex, offsetBy: index))
                        
                        var infoForCmp: [String:Int] = [:]
                        for c in copiedNum {
                            if let _ = infoForCmp[String(c)] {
                                infoForCmp[String(c)]! += 1
                            } else {
                                infoForCmp[String(c)] = 1
                            }
                        }
                        
                        for (index, c) in copiedNum.enumerated() {
                            if info[String(c)]! < infoForCmp[String(c)]! {
                                break
                            }
                            if index == copiedNum.count - 1 {
                                temp.insert(copiedNum)
                            }
                        }
                    }
                    let lastOne = num + String(c)

                    var infoForCmp: [String:Int] = [:]
                    for c in lastOne {
                        if let _ = infoForCmp[String(c)] {
                            infoForCmp[String(c)]! += 1
                        } else {
                            infoForCmp[String(c)] = 1
                        }
                    }

                    for (index, c) in lastOne.enumerated() {
                        if info[String(c)]! < infoForCmp[String(c)]! {
                            break
                        }
                        if index == lastOne.count - 1 {
                            temp.insert(lastOne)
                        }
                    }
                }
            }
            initial = Array(temp)
            result += Array(temp)
        }
        
        return result.map { Int($0)!}
    }
}
