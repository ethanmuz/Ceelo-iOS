//
//  Game.swift
//  Ceelo
//
//  Created by Ethan Uzarowski on 2/8/20.
//  Copyright © 2020 Ethan Uzarowski. All rights reserved.
//

import SwiftUI

class Game {
    var player1 = Player()
    var player2 = Player()
    var firstPlayer: Player? = nil
    var secondPlayer: Player? = nil
    var die1 = -1
    var die2 = -1
    var die3 = -1
    
    func rollFirst(player: Player) {
        die2 = Int.random(in: 1...6)
        player.firstRoll = die2
    }
    
    func decideWhoRollsFirst() {
        if (player1.firstRoll > player2.firstRoll) {
            firstPlayer = player1
            secondPlayer = player2
            print("Player 1 rolls first.")
        }
        else if (player2.firstRoll > player1.firstRoll) {
            firstPlayer = player2
            secondPlayer = player1
            print("Player 2 rolls first.")
        }
        else {
            print("Both players rolled a \(player1.firstRoll). Roll again.")
            player1.firstRoll = -1
            player2.firstRoll = -1
        }
    }
    
    func roll() -> Int {
        die1 = Int.random(in: 1...6)
        die2 = Int.random(in: 1...6)
        die3 = Int.random(in: 1...6)
        
        if (
            (die1 == 4 || die2 == 4 || die3 == 4) &&
            (die1 == 5 || die2 == 5 || die3 == 5) &&
            (die1 == 6 || die2 == 6 || die3 == 6)
            ) {
            return 100
        }
        else if (
            (die1 == 1 || die2 == 1 || die3 == 1) &&
            (die1 == 2 || die2 == 2 || die3 == 2) &&
            (die1 == 3 || die2 == 3 || die3 == 3)
            ) {
            return 0
        }
        else if (die1 == die2 && die2 == die3) {
            return die1 * 10
        }
        else if (die1 == die2) {
            return die3
        }
        else if (die2 == die3) {
            return die1
        }
        else if (die1 == die3) {
            return die2
        }
        else {
            return -1
        }
    }
    
    func determineWinner() {
        if (player1.score > player2.score) {
            print("Player 1 wins!")
        }
        else if (player2.score > player1.score) {
            print("Player 2 wins!")
        }
        else {
            print("Tied! Both players rolled \(player1.score). Reverse the order and roll again!")
            player1.score = -1
            player2.score = -1
            if (firstPlayer?.firstRoll == player1.firstRoll) {
                firstPlayer = player2
                secondPlayer = player1
            }
            else {
                firstPlayer = player1
                secondPlayer = player2
            }
        }
    }
    
    func buttonClicked() {
        if (!player1.hasRolledFirst()) {
            rollFirst(player: player1)
            print("Player 1 first roll: \(player1.firstRoll)")
        }
        else if (!player2.hasRolledFirst()) {
            rollFirst(player: player2)
            print("Player 2 first roll: \(player2.firstRoll)")
            decideWhoRollsFirst()
        }
        else if (!(firstPlayer?.hasRolled())!) {
            firstPlayer?.score = roll()
            if (firstPlayer?.firstRoll == player1.firstRoll) {
                print("Player 1 rolls: \(getScoreText(score: player1.score))")
            }
            else {
                print("Player 2 rolls: \(getScoreText(score: player2.score))")
            }
        }
        else if (!(secondPlayer?.hasRolled())!){
            secondPlayer?.score = roll()
            if (secondPlayer?.firstRoll == player1.firstRoll) {
                print("Player 1 rolls: \(getScoreText(score: player1.score))")
            }
            else {
                print("Player 2 rolls: \(getScoreText(score: player2.score))")
            }
            if ((secondPlayer?.hasRolled())!) {
                determineWinner()
            }
        }
    }
    
}
