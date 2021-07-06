//
//  해시_베스트앨범.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/02.
//

import Foundation

func 해시_베스트앨범() {
    
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        // [장르: (전체재생수, 플레이수:[식별자])]
        typealias Play = (total: Int, ids: [Int:[Int]])
        var musics = [String:Play]()
        
        for i in 0..<genres.count {
            let key = genres[i], play = plays[i]
            if musics.keys.contains(key) {
                musics[key]!.total += play
                if musics[key]!.ids.keys.contains(play) {
                    musics[key]!.ids[play]!.append(i)
                } else {
                    musics[key]!.ids[play] = [i]
                }
            } else {
                musics[key] = Play(total: play, ids: [play: [i]])
            }
        }

        var bestMusics = [Int]()
        for (_, value) in musics.sorted(by: { $0.value.total > $1.value.total }) {
            var count = 0
            for (_, ids) in value.ids.sorted(by: {$0.key > $1.key}) {
                for id in ids {
                    guard count < 2 else { break }
                    bestMusics.append(id)
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


