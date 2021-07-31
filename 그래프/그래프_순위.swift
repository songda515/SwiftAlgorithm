//
//  그래프_순위.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/26.
//

import Foundation

func 그래프_순위() {
    
    func solution(_ n:Int, _ results:[[Int]]) -> Int {
        
        enum GAME {
            case lose
            case unknown
            case win
        }
        
        var graph = Array(repeating: Array(repeating: GAME.unknown, count: n+1), count: n+1)
        
        results.forEach { result in
            let winner = result[0], loser = result[1]
            graph[winner][loser] = GAME.win
            graph[loser][winner] = GAME.lose
        }
        
        // 플로이드 와샬
        for k in 0...n {
            for from in 0...n {
                // from -> k 승패를 모르는 경우, 순위 계산 불가능
                if graph[from][k] == .unknown {
                    continue
                }
                
                for to in 0...n {
                    // k -> to 승패를 모르는 경우, 순위 계산 불가능
                    if graph[k][to] == .unknown {
                        continue
                    }
                    
                    // from vs to 우승이 되려면, (from vs k) 우승 && (k vs to) 우승이어야함
                    // from vs to 패배가 되려면, (from vs k) 패배 && (k vs to) 패배여야함
                    if graph[from][k] == graph[k][to] {
                        graph[from][to] = graph[from][k]
                    }
                }
            }
        }
        
        return graph
            .filter({ $0.filter({ $0 == .unknown }).count == 2})
            .count
    }
    
    print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])) // 2
}
