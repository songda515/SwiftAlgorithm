//
//  이분탐색_징검다리.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/02.
//

import Foundation

func 이분탐색_징검다리() {
    
    func countRemovedRocks(_ distance: Int, _ rocks: [Int], _ last: Int) -> Int {
        var count = 0
        var prevRock = 0
        for rock in rocks {
            if rock - prevRock >= distance {
                prevRock = rock // 제거하지 않는다.
            } else {
                count += 1 // 제거한다.
            }
        }
        if last - prevRock < distance {
            count += 1 // 마지막 돌과 최대거리 사이도 고려해줘야한다.
        }
        return count
    }
    
    func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
        // 이분탐색시 반드시 정렬필요!!
        let rocks = rocks.sorted()
        var start = 1
        var end = distance
        var answer = 0
        while start <= end {
            let mid = (start + end) / 2
            let count = countRemovedRocks(mid, rocks, distance)
            if count <= n {
                answer = mid // 정답 갱신
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return answer
    }
    
    print(solution(25, [2, 14, 11, 21, 17], 2)) // 4
}
