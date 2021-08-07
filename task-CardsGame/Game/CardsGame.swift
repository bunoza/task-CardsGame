//
//  CardsGame.swift
//  task-CardsGame
//
//  Created by Domagoj Bunoza on 05.08.2021..
//

import Foundation

class CardsGame {
    
    var sequence : [Int]
    var deckCompletedAfter : Int
    
    init(userInput: String) {
        
        var sequence = [Int](repeating: 0, count: 52)
        var deckCompletedAfter : Int = 0
        for i in 1...Int(userInput)! {
            let temp = Int.random(in: 0 ..< 52)
            sequence[temp] += 1
            if !sequence.contains(0) && deckCompletedAfter == 0 {
                deckCompletedAfter = i
            }
        }
//        print(sequence)
//        print(deckCompletedAfter)
        self.sequence = sequence
        self.deckCompletedAfter = deckCompletedAfter
    }
    
    func getSequence() -> [Int] {
        return sequence
    }
    
    func getDeckCompletedAfter() -> Int {
        return deckCompletedAfter
    }
    
}
