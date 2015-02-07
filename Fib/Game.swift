//
//  Game.swift
//  Fib
//
//  Created by Vijay Pemmaraju on 2/7/15.
//  Copyright (c) 2015 James Yanyuk. All rights reserved.
//

import Foundation

class Game {
    let p1:Player
    let p2:Player
    var currentPlayer:Player
    let currentRound:Int
    let currentScore:Int
    
    var otherPlayer:Player {
        get {
            if (currentPlayer === p1) {
                return p2
            } else {
                return p1
            }
        }
    }
    
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        let count = countElements(list)
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
    
    init (p1:Player, p2:Player) {
        self.p1 = p1
        self.p2 = p2
        self.currentPlayer = p1
      //  p1.beginGame(self)
     //   p2.beginGame(self)


        currentRound = 1
        currentScore = 0
    }
    
    func togglePlayer(){
        if (currentPlayer === p1) {
            currentPlayer = p2
        } else {
            currentPlayer = p1
        }
    }
    
  
    
    func createRound()->[(bif1:Statement, bif2:Statement, fib:Statement)] {
        let op = otherPlayer
        let bifs = op.getBifs()
        let fibs = op.getFibs()
        
        shuffle(bifs)
        shuffle(fibs)
        
        var questions:[(bif1:Statement, bif2:Statement, fib:Statement)] = []
        
        for i in 0..<5 {
            let question = (bif1:bifs[2*i], bif2:bifs[2*i+1], fib:fibs[i])
            questions.append(question)
        }

        return questions
    }
    
    
}

