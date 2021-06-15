//
//  programmers6.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/06/15.
//

import Foundation

func 완전탐색_카펫() {
    
    /**
     중앙에는 노란색으로 칠해져 있고 테두리 1줄은 갈색으로 칠해져 있는 격자 모양 카펫의 크기 찾기
     - parameters:
         - brown : 갈색 격자의 수, 8 <= brown <= 5000
         - yellow: 노란색 격자의 수, 1 <= yellow <- 2000000
     - returns: 카펫의 가로, 세로 크기를 배열에 담아 반환한다. [가로, 세로]
     */
    func solution(_ brown:Int, _ yellow:Int) -> [Int] {
        
        let sumOfWidthAndHeight = (brown + 4) / 2
        
        var height = 3 // 노란색 격자가 1이상이므로 최소높이가 3이어야함
        var width = sumOfWidthAndHeight - height
        while width >= height {
            
            let newYellow = (width - 2) * (height - 2)
            if newYellow == yellow {
                break
            }
            height += 1
            width -= 1
        }
        
        return [width, height]
    }
    print(solution(10, 2)) // [4, 3]
    print(solution(8, 1)) // [3, 3]
    print(solution(24, 24)) // [8, 6]
}
