//
//  그래프탐색_여행경로.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/19.
//

import Foundation

func 그래프탐색_여행경로() {
    
    // 주어진 항공권을 모두 이용하여 여행경로를 짜려고 합니다. 항상 "ICN" 공항에서 출발합니다.
    // 항공권 정보가 담긴 2차원 배열 tickets가 매개변수로 주어질 때, 방문하는 공항 경로를 배열에 담아 return 하도록 solution 함수를 작성해주세요.
    // 만일 가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 return 합니다.

    // 주의사항
    // 주어진 경로는 중복될 수 있다.
    // 맨 마지막 목적지에서 출발하는 티켓은 없을 수도 있다.
    
    func findCourse(_ tickets: inout [[String]], _ visited: inout [Bool],
                    _ src: String, _ course: [String]) -> [String] {
        
        if course.count == tickets.count+1 {
            return course
        }
        
        for (index, ticket) in tickets.enumerated() {
            if ticket[0] == src && visited[index] == false {
                visited[index] = true
                var newCourse = course
                newCourse.append(ticket[1]) // add dst
                let result = findCourse(&tickets, &visited, ticket[1], newCourse)
                if !result.isEmpty { return result }
                visited[index] = false
            }
        }
        return []
    }
    
    func solution(_ tickets:[[String]]) -> [String] {
        
        // 티켓의 도착지에 따라 오름차순 정렬.
        var tickets = tickets.sorted(by: { $0[1] < $1[1] })
        
        // 티켓을 사용했는지에 대해 visited 배열로 체크
        var visited = Array(repeating: false, count: tickets.count)
        
        // 티켓에 대해 DFS 수행 -> 가능한 경로를 반환한다.
        return findCourse(&tickets, &visited, "ICN", ["ICN"])
    }

    // 기본 예제 1
    print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
    //["ICN", "JFK", "HND", "IAD"]
          
    // 기본 예제 2
    print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
    // ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
    
    // 반례 1
    print(solution([["ICN", "BBB"],["ICN", "CCC"],["BBB", "CCC"],["CCC", "BBB"],["CCC", "ICN"]]))
    // ["ICN", "BBB", "CCC", "ICN", "CCC", "BBB"]

    // 반례 2
    print(solution([["ICN", "SFO"], ["SFO", "ICN"], ["ICN", "SFO"], ["SFO", "QRE"]]))
    // ["ICN", "SFO", "ICN", "SFO", "QRE"]

    // 반례 3
    print(solution([["ICN", "BOO"], ["ICN", "COO"], ["COO", "DOO"], ["DOO", "COO"], ["BOO", "DOO"], ["DOO", "BOO"], ["BOO", "ICN"], ["COO", "BOO"]]))
    // ["ICN", "BOO", "DOO", "BOO", "ICN", "COO", "DOO", "COO", "BOO"]))
        
    // 반례 4 * 런타임 에러 해결 (ZOO 에서 출발하는 티켓이 없어 딕셔너리접근x 런타임에러 발생)
    print(solution([["ICN", "AOO"], ["AOO", "BOO"], ["AOO", "BOO"], ["BOO", "AOO"], ["BOO", "FOO"], ["FOO", "COO"], ["COO", "ZOO"]]))
    // ["ICN", "AOO", "BOO", "AOO", "BOO", "FOO", "COO", "ZOO"]
}
