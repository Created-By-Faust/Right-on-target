//
//  Game.swift
//  Right on target
//
//  Created by Дмитрий Емелин on 27.09.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    var score = 0
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currentSecretValue = 0
    
    private var lastRound: Int
    private var currentRound = 1
    
    var isGameEnded: Bool {
        return currentRound >= lastRound ? true : false
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        
        if startValue <= endValue {
            minSecretValue = startValue
            maxSecretValue = endValue
            lastRound = rounds
            currentSecretValue = self.getNewSecretValue()
        } else {
            return nil
        }
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    func calculateScore(with value: Int) {
                
        switch value {
        case _ where value > currentSecretValue : score += 50 - value + currentSecretValue
        case _ where value < currentSecretValue: score += 50 - currentSecretValue  + value
        default: score += 50
        }
    }
    
    private func getNewSecretValue() -> Int{
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    
}
