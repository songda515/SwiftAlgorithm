//
//  완전탐색_모의고사.swift
//  SwiftAlgorithm
//
//  Created by Dain Song on 2021/06/15.
//

func 완전탐색_소수찾기() {
    
    struct PrimeNumber {
        
        var numbers = Set<Int>()
        var maxNumber: Int {
            return numbers.max()!
        }
        
        mutating func dfs(_ array: [Int], _ number: [Int]) {
            if array.isEmpty {
                return
            }
            for i in 0..<array.count {
                var newArray = array, newNumber = number
                newNumber.append(newArray.remove(at: i))
                numbers.insert(newNumber.reduce(0, {$0*10 + $1}))
                dfs(newArray, newNumber)
            }
        }
        
        func isPrime(_ number:Int) -> Bool {
            guard number > 1 else {
                return false
            }
            
            for i in 2..<number {
                if number % i == 0 {
                    return false
                }
            }
            return true
        }
    }
    
    func solution(_ numbers:String) -> Int {
        
        let array = numbers.map{Int(String($0))!}
        var primeNumber = PrimeNumber()
        primeNumber.dfs(array, [])

        var count = 0
        for number in primeNumber.numbers {
            if primeNumber.isPrime(number) {
                count += 1
            }
        }
        return count
    }

    // 가능한 수 [11, 0, 101, 1, 10, 110] -> 소수 11, 101 => 2개
    print(solution("011"))
    // 가능한 수 [17, 1, 71, 7] -> 소수 17, 71, 7 => 3 개
    print(solution("17"))
}
