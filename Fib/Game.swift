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
    var gameViewController:GameViewController
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
        if (count == 0) {return list}
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
    
    init (p1:Player, p2:Player, gameViewController: GameViewController) {
        self.p1 = p1
        self.p2 = p2
        self.currentPlayer = p1
        self.currentQuestion = 0
        self.currentQuestions = []
      //  p1.beginGame(self)
        //p2.beginGame(self)
        self.gameViewController = gameViewController


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
            gameViewController.goToGameOver("p2's turn")
           createRound()
        }
        else {
            currentRound++
        }
        
        if(currentRound == 1){
            endGame()
        }
    }
    
  
    
    func endGame(){
      
        //create instance of next view controller and set it to certain characteristics depending on who won or lost
        if(p1.roundScore > p2.roundScore){
            gameViewController.goToGameOver("win")
        }
        else if(p2.roundScore > p1.roundScore){
           gameViewController.goToGameOver("lose")
            
        }
        else{
            gameViewController.goToGameOver("tie")
          
        }
      

    }
    
    func getCurrentQuestion() -> (bif1:Statement, bif2:Statement, fib:Statement) {
        return currentQuestions[currentQuestion]
    }
    
    
    func answerQuestion(statement:Statement){
       let question = currentQuestions[currentQuestion]
        
        if(statement === question.fib){
            currentPlayer.roundScore++
        }
        
        currentQuestion++
        
        if (currentQuestion == 5){
            endRound()
        }
    }
    
}

