//
//  해시_베스트앨범.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/02.
//

import Foundation

func 해시_베스트앨범() {
    
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        var genresDict = [String: Int]()
        var musicDict = [String: [Int]]()
        var playDict = [String: [Int]]()

        for i in 0..<genres.count {
            if genresDict.keys.contains(genres[i]) {
                genresDict[genres[i]]! += plays[i]
                playDict[genres[i]]!.append(plays[i])
            } else {
                genresDict[genres[i]] = plays[i]
                playDict[genres[i]] = [plays[i]]
            }
            
            let key = genres[i] + String(plays[i])
            if musicDict.keys.contains(key) {
                musicDict[key]!.append(i)
            } else {
                musicDict[key] = [i]
            }
        }
        
        var bestMusics = [Int]()
        for (k, _) in genresDict.sorted(by: { $0.value > $1.value }) {
            var count = 0
            for play in playDict[k]!.sorted(by: >) { // 2500, 600
                let key = k + String(play)
                for music in musicDict[key]!.sorted() {
                    if count == 2 { break }
                    bestMusics.append(music)
                    count += 1
                }
            }
        }
        
        return bestMusics
    }
    
    print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 500, 800, 2500]))//, [4, 1, 3, 0])
    print(solution(["classic", "pop", "classic", "classic"], [200, 600, 500, 500]))
}


