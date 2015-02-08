//
//  Player.swift
//  Fib
//
//  Created by Vijay Pemmaraju on 2/7/15.
//  Copyright (c) 2015 James Yanyuk. All rights reserved.
//

import Foundation


class Player {
    var fname: String = ""
    var lname: String = ""
    
    var id:String = ""
    var statements:[Statement]
    var games:[Game]
    
    //game variables
    var roundScore:Int = 0
    var gameScore:Int = 0

    
    init(fbid:String) {
        id = fbid
        statements = []
        
       
        games = []
        makeRandomStatements()
    }
    
    func makeRandomStatements() {
        for i in 0..<10 {
            println("HI")
            statements.append(Statement(type: true, text: "bif" + String(i+1)))
            statements.append(Statement(type: false, text: "fib" + String(i+1)))
        }
    }
    
    func beginGame(game:Game) {
        games.append(game)
    }
    
    
    func getFibs()->[Statement] {
        var fibs:[Statement] = []
        for statement:Statement in statements {
            if statement.type == false {
                fibs.append(statement)
            }
        }
        return fibs
    }
    
    func getBifs()->[Statement] {
        var bifs:[Statement] = []
        for statement:Statement in statements {
            if statement.type == true {
                bifs.append(statement)
            }
        }
        return bifs
    }
 
}