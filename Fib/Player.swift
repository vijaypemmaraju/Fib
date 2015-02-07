//
//  Player.swift
//  Fib
//
//  Created by Vijay Pemmaraju on 2/7/15.
//  Copyright (c) 2015 James Yanyuk. All rights reserved.
//

import Foundation


class Player {
    let id:String = ""
    var statements:[Statement]
    var games:[Game]
    
    init(fbid:String) {
        id = fbid
        statements = []
        games = []
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
            if statement.type == false {
                bifs.append(statement)
            }
        }
        return bifs
    }
 
}