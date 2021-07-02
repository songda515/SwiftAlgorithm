//
//  이분탐색_입국심사.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/02.
//

import Foundation

func 이분탐색_입국심사() {
    
    /* memo
     이진탐색 시간복잡도 O(logN) / 배열 구현 O(N)
     이진탐색에서 count == n 이 아닌 count >= n 일 때, 정답을 갱신해야 하는 이유?
     n명 이상 검사가 가능한 상황에서, 이후 count < n 만 나타난다면 정답이 갱신되지 않을 수 있다.
     테스트케이스 6, 9 번에서 다음과 같은 상황이 나타난다.
    */
    
    func countPerson(_ time: Int64, _ times: [Int]) -> Int64 {
        var count: Int64 = 0
        times.forEach {
            count += time / Int64($0)
        }
        return count
    }

    func solution(_ n:Int, _ times:[Int]) -> Int64 {
        var start: Int64 = 1
        var end: Int64 = Int64(times.max()! * n)
        var answer: Int64 = Int64.max
        while start <= end {
            let mid: Int64 = (start + end) / 2
            let count: Int64 = countPerson(mid, times)
            if count >= n { // n명을 검사했더라도, 더 적은 시간을 소요할수도 있음
                answer = mid
                end = mid - 1
            } else if count < n { // n명을 검사하지 못한다면, 더 큰 시간을 소요해야함
                start = mid + 1
            }
        }
        return answer
    }
    
    print(solution(6, [7, 10])) // 28
}
