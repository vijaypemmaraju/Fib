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
    var currentRound:Int
    var currentScore:Int
    var currentQuestion:Int
    var currentQuestions:[(bif1:Statement, bif2:Statement, fib:Statement)]
        
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
        self.currentQuestion = 0
        self.currentQuestions = []
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
    
  
    
    func createRound() {
        let op = otherPlayer
        let bifs = op.getBifs()
        let fibs = op.getFibs()
        currentPlayer.roundScore = 0
    
        
        shuffle(bifs)
        shuffle(fibs)
        
        var questions:[(bif1:Statement, bif2:Statement, fib:Statement)] = []
        
        for i in 0..<5 {
            let question = (bif1:bifs[2*i], bif2:bifs[2*i+1], fib:fibs[i])
            questions.append(question)
        }

       self.currentQuestions = questions
    }
    
    func endRound(){
        
        if(currentPlayer === p1){
           currentPlayer = p2
            createRound()
        }
        else{
            if(p1.roundScore > p2.roundScore){
                p1.gameScore++
            }
            else if(p2.roundScore > p1.roundScore){
               p2.gameScore++
            }
            else{
                //make a tie case
            }
        }
        currentRound++
        
        if(currentRound == 5){
            //endGame()
        }
    }
    
    func endGame(){
        if(p1.gameScore > p2.gameScore){
            //p1.win()
        }
        else if(p2.gameScore > p1.gameScore){
            //p2.win()
        }
        else{
            //make a tie case
        }
    }
    
    
    func answerQuestion(statement:Statement){
       let question = currentQuestions[currentQuestion]
        
        if(statement === question.fib){
            currentPlayer.roundScore++
        }
        
        currentQuestion++
        
        if (currentQuestion == 5){
            //endRound()
        }
    }
    
    
}

