//
//  완전탐색_BOJ10819.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/23.
//

import Foundation

/* 차이를 최대로
Input
6
20 1 15 8 4 10
Output
62
 */
func 완전탐색_BOJ10819() {
    
    var answer = Int.min
    
    func dfs(_ array: [Int], _ visited: inout [Bool], _ i: Int, _ total: Int) {
        
        if visited.filter({ $0 }).count == array.count {
            answer = max(answer, total)
            return
        }
        
        array.enumerated().forEach { index, element in
            guard visited[index] == false else { return }
            visited[index] = true
            dfs(array, &visited, index, total+abs(array[i]-element))
            visited[index] = false
        }
    }
    
    let N = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var visited = Array(repeating: false, count: N)
    
    for i in 0..<N {
        visited[i] = true
        dfs(array, &visited, i, 0)
        visited[i] = false
    }
    
    print(answer)
}
