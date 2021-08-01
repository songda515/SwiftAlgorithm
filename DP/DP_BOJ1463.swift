//
//  DP_BOJ1463.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/08/01.
//

import Foundation

func DP_BOJ1463() {
    // 1로 만들기
    // 1 -> 0
    // 2 -> 1
    // 10 -> 3 :: 10/2 = 5 > 4 > 2 > 1 도 가능하지만, 10-1 = 9 -> 3 > 1 로 3번에 가능하다.
    
    func solution() -> Int {
        let n = Int(readLine()!)!
        guard n > 1 else { return 0 }

        var dp = Array(repeating: 0, count: n+1)
        for i in 2...n {
            if i % 6 == 0 {
                dp[i] = min(dp[i/3], dp[i/2], dp[i-1]) + 1
            } else if i % 3 == 0 {
                dp[i] = min(dp[i/3], dp[i-1]) + 1
            } else if i % 2 == 0 {
                dp[i] = min(dp[i/2], dp[i-1]) + 1
            } else {
                dp[i] = dp[i-1] + 1
            }
        }
        return dp[n]
    }
    print(solution())

}
