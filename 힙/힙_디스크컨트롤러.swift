//
//  힙_디스크컨트롤러.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/17.
//

import Foundation

func 힙_디스크컨트롤러() {
    
    func solution(_ jobs:[[Int]]) -> Int {
        
        var time = 0
        var answer = 0
        
        // 소요시간으로 정렬
        var sortedJobs = jobs.sorted(by: {$0[1] < $1[1]})
        
        while !sortedJobs.isEmpty {
            for i in 0..<sortedJobs.count {
                // 가능한 작업이 있을 때, 가장 짧은 시간의 작업 수행
                if sortedJobs[i][0] <= time {
                    time += sortedJobs[i][1]
                    answer += time - sortedJobs[i][0]
                    sortedJobs.remove(at: i)
                    break
                }
                // 가능한 작업이 없을 때, 시간을 증가시킨다.
                if i == sortedJobs.count - 1 {
                    time += 1
                }
            }
        }
        return answer / jobs.count
    }
}
