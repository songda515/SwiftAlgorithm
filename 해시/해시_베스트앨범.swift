//
//  해시_베스트앨범.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/02.
//

import Foundation

func 해시_베스트앨범() {
    
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        var musicDict = [String: [Int]]()
        var playDict = [String: (total: Int, each: [Int])]()

        for i in 0..<genres.count {
            if playDict.keys.contains(genres[i]) {
                playDict[genres[i]]!.total += plays[i]
                playDict[genres[i]]!.each.append(plays[i])
            } else {
                playDict[genres[i]] = (total: plays[i], each: [plays[i]])
            }

            let key = genres[i] + String(plays[i])
            if musicDict.keys.contains(key) {
                musicDict[key]!.append(i)
            } else {
                musicDict[key] = [i]
            }
        }

        var bestMusics = [Int]()
        for (k, value) in playDict.sorted(by: { $0.value.total > $1.value.total }) {
            var count = 0
            for play in value.each.sorted(by: >) {
                let key = k + String(play)
                for music in musicDict[key]!.sorted() {
                    guard count < 2 else { break }
                    bestMusics.append(music)
                    count += 1
                }
            }
        }

        return bestMusics
    }
    
    print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])) // [4, 1, 3, 0]
    print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 500, 800, 2500])) // [4, 1, 3, 0]
    print(solution(["classic", "pop", "classic", "classic"], [200, 600, 500, 500])) // [2, 3, 1]
}


