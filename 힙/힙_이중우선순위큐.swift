//
//  힙_이중우선순위큐.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/17.
//

// remove 시에 정렬을 하더라도, 매번 정렬이 어느정도 되어있기 때문에 시간복잡도가 크진 않다.
// 아래 작성한 코드는 append 시에 정렬되도록 작성한 코드.

import Foundation

func 힙_이중우선순위큐() {
    
    func solution(_ operations:[String]) -> [Int] {
        
        var queue = [Int]()
        
        let maxRemove = "D 1"
        let minRemove = "D -1"
        for op in operations {
            if op == maxRemove {
                if queue.isEmpty {
                    continue
                }
                queue.removeFirst()
            } else if op == minRemove {
                if queue.isEmpty {
                    continue
                }
                queue.removeLast()
            } else {
                let number = Int(String(op.split(separator: " ")[1]))!
                if queue.isEmpty {
                    queue.append(number)
                } else if number > queue.first! {
                    queue.insert(number, at: 0)
                } else if number < queue.last! {
                    queue.append(number)
                }
            }
        }
        if queue.isEmpty {
            return [0, 0]
        } else {
            return [queue.first!, queue.last!]
        }
    }
}
