//
//  Globals.swift
//  Fib
//
//  Created by James Yanyuk on 2/8/15.
//  Copyright (c) 2015 hackbeanpot. All rights reserved.
//

import Foundation

struct Globals {
    static var me:String = ""
    
    static func createPlayerFromPFObject(obj:PFObject) -> Player {
        var player:Player = Player(fbid: obj["id"] as String)
        //player.statements = obj["statements"] as [Statement]
        player.games = obj["games"] as [Game]
        
        return player
    }
    
    static func getPlayerFromID(id:String) -> Player {
        var query = PFQuery(className: "Player")
        query.whereKey("id", equalTo: id)
        var player = query.getFirstObject()
        
        return createPlayerFromPFObject(player)
    }
    
    static func createPFObjectFromPlayer(player:Player) -> PFObject {
        var object:PFObject = PFObject(className: "Player")
        object["id"] = player.id
        object["statements"] = player.statements
        object["games"] = player.games
        
        return object
    }
    
    //Stores hex values of colors for UI
    //returns: CGColor
    static func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor{
        
        //rgb value = hex color value
        //alpha = transparancy
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}