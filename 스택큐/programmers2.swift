//
//  programmers2.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/06/15.
//

func programmers2() {
    
    /**
     [스택/큐 - 프린터] 중요도가 높은 문서를 먼저 인쇄하는 프린터
    - 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼낸다.
    - 나머지 인쇄 대기 목록에서 J보다 중요도가 높은 문서가 존재하면 J를 대기 목록의 가장 마지막에 넣는다.
    - 그렇지 않으면 J를 인쇄한다.
     
    - parameters:
        - priorities : 문서의 중요도가 순서대로 담긴 배열
        - location : 내가 인쇄를 요청한 문서의 위치
    - returns : 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 반환한다.
    */
    func solution(_ priorities:[Int], _ location:Int) -> Int {
        
        var priorities = priorities, location = location

        var count = 0
        while !priorities.isEmpty {
            
            var printing = true
            let j = priorities.first!
            
            for priority in priorities {
                if j < priority {
                    priorities.append(priorities.removeFirst())
                    location = location == 0 ? priorities.count - 1 : location - 1
                    printing = false
                    break
                }
            }
            if printing {
                count += 1
                priorities.removeFirst()
                if location == 0 { break }
                location -= 1
            }
        }
        return count
    }
    print(solution([2, 1, 3, 2], 2))
    print(solution([1, 1, 9, 1, 1, 1], 0))
}
