//
//  그래프탐색_단어변환.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/20.
//

import Foundation

func 그래프탐색_단어변환() {
    
    func getNeighbours(_ words: [String]) -> [[Int]] {
        let n = words.count
        var neighbours = Array(repeating: [Int](), count: n)
        for i in 0..<n {
            for j in i+1..<n {
                var count = 0
                zip(words[i], words[j]).forEach { (c1, c2) in
                    if c1 != c2 { count += 1 }
                }
                if count == 1 {
                    neighbours[i].append(j)
                    neighbours[j].append(i)
                }
            }
        }
        return neighbours
    }
    
    /// BFS
    func findShortestPath(_ neighbours: [[Int]], _ words: [String], _ target: String) -> Int {
        let n = neighbours.count
        var queue = [Int]()
        var depth = Array(repeating: 0, count: n)
        var visited = Array(repeating: false, count: n)
        
        queue.append(0)
        visited[0] = true
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if words[current] == target {
                return depth[current]
            }
            for next in neighbours[current] {
                if visited[next] == false {
                    visited[next] = true
                    depth[next] = depth[current] + 1
                    queue.append(next)
                }
            }
        }
        return 0
    }

    func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
        
        // Step0. 비긴도 단어에 추가, 타겟이 없는 경우 만들 수 없음
        guard words.contains(target) else {
            return 0
        }
        var words = words
        words.insert(begin, at: 0)
        
        // Step1. 알파벳 하나를 바꿔서 단어로 변환할 수 있는 경우, 이웃 노드로 설정!
        let neighbours = getNeighbours(words)
        
        // Step2. begin부터 시작하여 한 글자씩 바꿔나가면서 target이 되는 최소 경로를 찾기!
        return findShortestPath(neighbours, words, target)
    }

    print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])) // 4
   // print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"])) //0

}

