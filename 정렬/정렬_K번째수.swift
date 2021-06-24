//
//  정렬_K번째수.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/06/24.
//

import Foundation

func 정렬_K번째수() {
    
    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        var answer = [Int]()
        for command in commands {
            let i = command[0], j = command[1], k = command[2]
            answer.append(array[i-1...j-1].sorted()[k-1])
        }
        return answer
    }
    
    solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])
}
