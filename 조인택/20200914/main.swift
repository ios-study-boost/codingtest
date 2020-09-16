//
//  main.swift
//  DiskController
//
//  Created by In Taek Cho on 2020-09-14.
//  Copyright © 2020 dlsxor21c. All rights reserved.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sortedJobs = jobs.sorted { $0[1] < $1[1] }
    
    var now = 0
    var totalTime = 0
    var doneJob: [Int]?
    let length = sortedJobs.count
    
    while sortedJobs.count != 0 {
        for (index, job) in sortedJobs.enumerated() {
            if job[0] <= now {
                totalTime += (now + job[1] - job[0])
                now += job[1]
                doneJob = job
                break
            }
            
            if index == sortedJobs.count - 1 {
                now += 1
            }
        }
        
        if let job = doneJob {
            sortedJobs.remove(at: sortedJobs.firstIndex(of: job)!)
            doneJob = nil
        }
    }
    
    return totalTime / length
}
