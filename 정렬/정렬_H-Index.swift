//
//  정렬_H-Index.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/06/24.
//

import Foundation

func 정렬_Hindex() {
    
    // hIndex 를 증가하면서 hIndex 이상인 논문의 개수를 센 풀이
    func solution1(_ citations:[Int]) -> Int {
        
        var hIndex = 0
        while hIndex <= citations.max()! {
            let count = citations.filter { $0 >= hIndex }.count
            if count < hIndex { break }
            hIndex += 1
        }
        return hIndex - 1
    }
    
    // 논문 인용횟수를 내림차순 정렬한 후, 그 값을 hIndex로 이용하는 풀이
    func solution(_ citations:[Int]) -> Int {
        
        let citations = citations.sorted(by: >)
        for hIndex in 0..<citations.count {
            if hIndex >= citations[hIndex] {
                return hIndex
            }
        }
        return citations.count
    }
    
    print(solution([3, 0, 6, 1, 5]))
}
