//
//  그래프_가장먼노드.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/26.
//

import Foundation

func 그래프_가장먼노드() {
    
    func bfs(_ graph: [[Int]]) -> Int {

        var depth = Array(repeating: 0, count: graph.count)
        var queue = [1] // 1번 노드부터 시작
        depth[1] = 1
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            for next in graph[current] {
                if depth[next] == 0 {
                    depth[next] = depth[current] + 1
                    queue.append(next)
                }
            }
        }
        
        let maxDepth = depth.max()!
        return depth.filter { $0 == maxDepth }.count
    }
    
    func solution(_ n:Int, _ edge:[[Int]]) -> Int {
        
        var graph = Array(repeating: [Int](), count: n+1)
        
        edge.forEach { e in
            graph[e[0]].append(e[1])
            graph[e[1]].append(e[0])
        }
                
        return bfs(graph)
    }

    print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])) //3
}
