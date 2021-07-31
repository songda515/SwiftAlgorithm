//
//  완전탐색_BOJ2798.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/31.
//

import Foundation

func 완전탐색_BOJ2798() {
   
    // 블랙잭 : 카드의 합이 21을 넘지 않는 한도 내에서, 카드의 합을 최대한 크게 만드는 게임
    // 블랙잭 변형 게임
    // 이제 플레이어는 제한된 시간 안에 N장의 카드 중에서 3장의 카드를 골라야 한다.
    // 플레이어가 고른 카드의 합은 M을 넘지 않으면서 M과 최대한 가깝게 만들어야 한다.
    
    let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let N = NM[0], M = NM[1]
    let cards = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var answer = 0

    for i in 0..<N {
        for j in i+1..<N {
            for k in j+1..<N {
                let sum = cards[i] + cards[j] + cards[k]
                if sum <= M && sum > answer {
                    answer = sum
                }
            }
        }
    }

    print(answer)
}
