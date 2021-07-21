//
//  그래프탐색_타겟넘버.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/21.
//

import Foundation

func 그래프탐색_타겟넘버() {
    
    func dfs(numbers: [Int], target: Int, i: Int, total: Int) -> Int {
        if i == numbers.count {
            return total == target ? 1 : 0
        }
        
        let count1 = dfs(numbers: numbers, target: target, i: i+1, total: total - numbers[i])
        let count2 = dfs(numbers: numbers, target: target, i: i+1, total: total + numbers[i])
        return count1 + count2
    }

    func solution(_ numbers:[Int], _ target:Int) -> Int {
        return dfs(numbers: numbers, target: target, i: 0, total: 0)
    }
}
