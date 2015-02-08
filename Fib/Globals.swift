//
//  Globals.swift
//  Fib
//
//  Created by James Yanyuk on 2/8/15.
//  Copyright (c) 2015 hackbeanpot. All rights reserved.
//

import Foundation

struct Globals {
    static var me:FBGraphUser? = nil
    
    func createPlayerFromPFObject(obj:PFObject) -> Player {
        var player:Player = Player(fbid: obj["id"] as String)
        player.statements = obj["statements"] as [Statement]
        player.games = obj["games"] as [Game]
        
        return player
    }
    
    func createPFObjectFromPlayer(player:Player) -> PFObject {
        var object:PFObject = PFObject(className: "Player")
        object["id"] = player.id
        object["statements"] = player.statements
        object["games"] = player.games
        
        return object
    }
}