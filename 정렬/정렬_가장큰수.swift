//
//  정렬_가장큰수.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/06/24.
//

import Foundation

func 정렬_가장큰수() {
    
    // 첫번째 풀이 - sort, reduce, if-else 활용
    func solution1(_ numbers:[Int]) -> String {
        
        var stringNumbers: [String] = numbers.map { String($0) }
        stringNumbers.sort { prev, next in
            let first = prev + next
            let second = next + prev
            return first > second
        }
        
        let answer = stringNumbers.reduce("", +)
        if answer.first! == "0" {
            return "0"
        } else {
            return answer
        }
    }
    
    // 두번째 풀이 - sorted 축약, joined, 삼항연산자 활용
    func solution(_ numbers:[Int]) -> String {

        let stringNumbers: [String] = numbers.map { String($0) }
        let answer = stringNumbers.sorted { return $0+$1 > $1+$0 }.joined()
        return answer.first! == "0" ? "0" : answer
    }
    
    print(solution([6, 10, 2])) // 6210
    print(solution([3, 30, 34, 5, 9])) // 9534330
    print(solution([0, 0, 0, 0])) // 0
}

// 참고
// https://sihyungyou.github.io/programmers-가장큰수/
