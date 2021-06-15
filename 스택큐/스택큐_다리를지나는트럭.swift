//
//  programmers3.swift
//  Algorithm
//
//  Created by Dain Song on 2021/06/14.
//

import Foundation

func 스택큐_다리를지나는트럭() {
    
    // 트럭 여러 대가 일차선 다리를 정해진 순으로 건너야 한다.
    // 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내기
    // bridge_length :: 다리의 길이 = 다리에 올라갈 수 있는 최대 트럭 수
    // weight :: 다리가 버틸 수 있는 무게
    // truck_weights :: 트럭 별 무게
    // return :: 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지

    func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        
        var truck_weights = truck_weights // 값을 변경하기 위해 변수로 재할당
        var bridgeQueue = [Int]() // 다리를 건너고 있는 트럭을 저장하기 위한 큐 (배열)
        var truckTime = [Int]() // 다리를 건너고 있는 트럭의 위치를 저장하기 위한 큐 (배열)
        var time = 1
        var totalWeight = 0

        while !(truck_weights.isEmpty && truckTime.isEmpty) {

            // 대기 트럭의 첫번째가 존재하고 무게가 가능할 때,
            // 무게를 더하고 bridgeQueue 와 truckTime 에 값을 추가한다.
            if let nextTruck = truck_weights.first {
                if totalWeight + nextTruck <= weight {
                    totalWeight += nextTruck
                    bridgeQueue.append(truck_weights.removeFirst())
                    truckTime.append(0)
                }
            }

            for i in 0..<truckTime.count {
                truckTime[i] += 1
            }
            
            // 다리를 건너는 중인 첫번째 트럭이 다리를 다 건넜을때,
            // 무게를 빼고 bridgeQueue 와 truckTime 에 값을 제외한다.
            let firstTruckTime = truckTime.first!
            if firstTruckTime == bridge_length {
                totalWeight -= bridgeQueue.removeFirst()
                truckTime.removeFirst()
            }
            time += 1
        }
        return time
    }
    print(solution(2, 10, [7,4,5,6])) // 8
    print(solution(100, 100, [10])) // 101
    print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10])) // 110
}
