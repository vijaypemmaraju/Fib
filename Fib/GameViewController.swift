//
//  GameViewController.swift
//  Fib
//
//  Created by FIB team on 2/7/15.
//  Copyright (c) 2015 FIB. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    //var game = Game(p1: playOne, p2: playTwo)
    
    var data:AnyObject! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //label.text = data.first_name
    }
    
    @IBAction func click(sender: UIButton) {
       // game.answerQuestion(statement:Statement)
       // game.endRound()
        
    }
    
}
