//
//  완전탐색_BOJ15686.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/31.
//

import Foundation

func 완전탐색_BOJ15686() {
    
    let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let N = NM[0], M = NM[1]
    typealias Coord = (y: Int, x: Int)
    var chickens = [Coord]()
    var homes = [Coord]()
    var minCityDistance = Int.max
    
    // 집과 치킨집의 위치를 저장
    for i in 0..<N {
        let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
        line.enumerated().forEach { j, element in
            if element == 1 {
                homes.append(Coord(y: i, x: j))
            } else if element == 2 {
                chickens.append(Coord(y: i, x: j))
            }
        }
    }
        
    // DFS를 통해 M개의 치킨집의 조합을 구한다.
    func dfs(_ i: Int, _ remains: [Int]) {
        if remains.count == M {
            let cityDistance = findCityDistance(remains)
            if cityDistance < minCityDistance {
                minCityDistance = cityDistance
            }
            return
        }
        
        for j in i..<chickens.count {
            if remains.contains(j) == false {
                var remains = remains
                remains.append(j)
                dfs(j, remains)
            }
        }
    }
    
    // 집과 선택된 치킨집들로 도시의 치킨 거리를 찾는 함수
    func findCityDistance(_ remains: [Int]) -> Int {
        var cityDistance = 0
        for home in homes {
            var minDistance = Int.max
            for j in remains {
                let distance = abs(home.y - chickens[j].y) + abs(home.x - chickens[j].x)
                if distance < minDistance {
                    minDistance = distance
                }
            }
            cityDistance += minDistance
        }
        return cityDistance
    }
    
    // Run & Output
    dfs(0, [Int]())
    print(minCityDistance)
}
