//
//  그래프탐색_네트워크.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/19.
//

import Foundation

func 그래프탐색_네트워크() {

    // 네트워크 개수를 return -> DFS 로 같은 네트워크 전부 체크
    // computers[i][j] : i번과 j번이 연결되어있으면 1, 아니면 0

    func dfs(_ graph: [[Int]], _ visited: inout [Bool], _ i: Int) {
        if i == graph.count {
            return
        }
        visited[i] = true
        for (j, isConnect) in graph[i].enumerated() {
            if isConnect == 1 && !visited[j] {
                dfs(graph, &visited, j)
            }
        }
    }

    func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        
        var visited = Array(repeating: false, count: n)
        var count = 0
        
        for i in 0..<n {
            if visited[i] == false {
                dfs(computers, &visited, i)
                count += 1
            }
        }

        return count
    }
    
    print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])) // 2
    print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])) // 1
}
