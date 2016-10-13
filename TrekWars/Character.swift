//
//  Character.swift
//  TrekWars
//
//  Created by James Campagno on 10/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


struct Arena {
    var firstCharacter: Character
    var secondCharacter: Character
    
    mutating func fight() {
        guard let fightResult = firstCharacter.fight(secondCharacter) else { return }
        switch fightResult {
        case .loss:
            secondCharacter.wonFight(with: fightResult)
        case .win:
            secondCharacter.loseFight(with: fightResult)
        }
    }
}


struct Character {
    let name: String
    var power: Double
    private var winningFights: [FightResult] = []
    private var losingFights: [FightResult] = []
    
    var hitPoints: Double {
        didSet { checkForDeath() }
    }
    
    var isDead: Bool = false {
        didSet { print("☠️") }
    }
    
    var totalBattlesWon: Int {
        return winningFights.count
    }
    
    var totalBattlesLost: Int {
        return losingFights.count
    }
    
    mutating func checkForDeath() {
        if hitPoints < 0 {
            isDead = true
            hitPoints = 0.0
        }
        
    }
    
    mutating func fight(_ character: Character) -> FightResult? {
        guard power != character.power else { return nil }
        
        if power > character.power {
            let hit = power.truncatingRemainder(dividingBy: 10)
            let fightResult = FightResult.win(name: character.name, hit: hit)
            wonFight(with: fightResult)
            return fightResult
        }
        
        if power < character.power {
            let hit = character.power.truncatingRemainder(dividingBy: 10)
            let fightResult = FightResult.loss(name: character.name, hit: hit)
            loseFight(with: fightResult)
            hitPoints -= hit
            return fightResult
        }
        
        return nil
    }
    
    mutating func wonFight(with result: FightResult) {
        winningFights.append(result)
    }
    
    mutating func loseFight(with result: FightResult) {
        losingFights.append(result)
    }
}


enum FightResult {
    case win(name: String, hit: Double)
    case loss(name: String, hit: Double)
}
