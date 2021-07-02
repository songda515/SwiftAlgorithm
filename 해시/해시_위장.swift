//
//  해시_위장.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/07/02.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {

    // 의상의 이름은 중복되지 않으므로 개수만 세면 된다.
    // 의상의 종류 : 의상의 개수
    var clothesDict : [String: Int] = [:]

    for cloth in clothes {
        let key = cloth[1]
        if !clothesDict.keys.contains(key) {
            clothesDict[key] = 0
        }
        clothesDict[key]? += 1
    }

    var count = 1
    for num in clothesDict.values {
        count *= (num + 1)
    }

    return count-1
}
