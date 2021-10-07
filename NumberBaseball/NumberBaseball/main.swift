//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func makingRandomNumbers() -> Array<Int> {
    var nonDuplicateNumbers = Set<Int>()
    
    repeat {
        nonDuplicateNumbers.insert(Int.random(in: 1...9))
    } while nonDuplicateNumbers.count < 3
    
    let randomNumbers = Array(nonDuplicateNumbers)
    
    return randomNumbers
}

func compareNumbers(randomNumbers: Array<Int>, userNumbers: Array<Int>) {
    var strikeCounts = 0
    var ballCounts = 0
    
    for numberIndex in 0...2 {
        if randomNumbers[numberIndex] == userNumbers[numberIndex] {
            strikeCounts += 1
        } else if randomNumbers.contains(userNumbers[numberIndex]){
            ballCounts += 1
        }
    }
    
    print("\(strikeCounts) 스트라이크, \(ballCounts) 볼")
}

func printNumbers(_ radomArray: Array<Int>) {
    print("임의의 수: \(radomArray[0]) \(radomArray[1]) \(radomArray[2])")
}

func launchBaseBall() {
    let randomNumbers: Array<Int> = makingRandomNumbers()
    var userNumbers: Array<Int> = Array<Int>()
    var gameCount: Int = 9

    while gameCount > 0 {
        userNumbers = makingRandomNumbers()
        printNumbers(userNumbers)
        compareNumbers(randomNumbers: randomNumbers, userNumbers: userNumbers)

        if randomNumbers == userNumbers {
            break
        }

        gameCount -= 1
        print("남은 기회 : \(gameCount)")
    }

    if gameCount == 0 {
        print("컴퓨터 승리...!")
    } else {
        print("사용자 승리!")
    }
}

func printMenuAndRecieveMenuNumber() -> String? {
    print("""
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요 :
    """, terminator: " ")
    
    let userInput = readLine()
    
    return userInput
}

func numberBaseball() {
OUTER: repeat {
        guard let menuNumber = printMenuAndRecieveMenuNumber() else {
            print("입력이 잘못되었습니다")
            return
        }
    
        switch menuNumber {
        case "1":
            launchBaseBall()
        case "2":
            break OUTER
        default:
            print("입력이 잘못되었습니다.")
        }
    } while true
}

func recieveGameNumber() -> String? {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """, terminator: " ")
    
    let gameNumber = readLine()
    
    return gameNumber
}

