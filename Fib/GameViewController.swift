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
    

    func fetchFromParse(id: String, cb: (PFObject) -> ()) {
        var query = PFQuery(className: "Player")
        
        query.getObjectInBackgroundWithId(id) {
            (player: PFObject!, error: NSError!) -> Void in
            if(error != nil) {
                cb(player)
            } else {
                println("%@", error)
            }
        }
    }
    
    
    func goToGameOver(status:String){
        let gameOverView = self.storyboard?.instantiateViewControllerWithIdentifier("GameOVer") as GameOverViewController
        gameOverView.status = status
        self.presentViewController(gameOverView, animated: true, completion: nil)
        
    }
    
}
