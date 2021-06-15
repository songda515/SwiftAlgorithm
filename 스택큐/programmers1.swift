//
//  programmers_1.swift
//  Algorithm
//
//  Created by Dain Song on 2021/06/14.
//

import Foundation

func programmers1() {
    
    // 스택/큐 - 기능개발
    // 각 기능은 진도가 100% 일 때 서비스에 반영 가능
    // 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포
    // progresses :: 먼저 배포 되어야하는 순서대로 작업의 진도가 적힌 정수 배열
    // speeds :: 각 작업의 개발 속도가 적힌 정수 배열
    // return :: 각 배포마다 몇 개의 기능이 배포되는지
    
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

        var progresses = progresses, speeds = speeds
        let max = 100
        var answer = [Int]()

        while !progresses.isEmpty {

            // 하루가 지날때마다 작업의 진도를 계산
            let n = progresses.count
            for i in 0..<n {
                if progresses[i] + speeds[i] > max {
                    progresses[i] = max
                } else {
                    progresses[i] += speeds[i]
                }
            }

            // 배포가 가능한 경우, 배포할 수 있는 작업을 카운팅
            // Queue 구조를 이용, first 요소가 max 일 때만 고려한다.
            var count = 0
            var first = progresses.first
            if first! == max {
                while first != nil && first == max {
                    progresses.removeFirst()
                    speeds.removeFirst()
                    first = progresses.first
                    count += 1
                }
                answer.append(count)
            }
        }
        return answer
    }
    
    print(solution([93, 30, 55], [1, 30, 5]))
    print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
}
