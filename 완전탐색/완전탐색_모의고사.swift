//
//  완전탐색_모의고사.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/06/15.
//

import Foundation

func 완전탐색_모의고사() {
    
    func solution(_ answers:[Int]) -> [Int] {
        let test = [[1, 2, 3, 4, 5],
                    [2, 1, 2, 3, 2, 4, 2, 5],
                    [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
        let length = [5, 8, 10]
        var solve = [1:0, 2:0, 3:0]
        for i in 0..<answers.count {
            for j in 0...2 {
                if answers[i] == test[j][i % length[j]] {
                    solve[j+1]! += 1
                }
            }
        }
        let max_solve = solve.values.max()
        // 가장 많이 맞춘 학생 -> 그 학생의 키 -> 오름차순으로 정렬
        return solve.sorted(by: {$0.0 < $1.0}).filter{ $0.value == max_solve }.map{ $0.key }
    }
    print(solution([1,2,3,4,5])) // [1]
    print(solution([1,3,2,4,2])) // [1,2,3]
}
