//
//  GameViewController.swift
//  Fib
//
//  Created by FIB team on 2/7/15.
//  Copyright (c) 2015 FIB. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var label1: UIButton!
    @IBOutlet weak var label2: UIButton!
    @IBOutlet weak var label3: UIButton!
    
    @IBAction func button1(sender: AnyObject) {
        click(label1)
    }
    @IBAction func button2(sender: AnyObject) {
         click(label2)
    }
    @IBAction func button3(sender: AnyObject) {
         click(label3)
    }
    
    @IBOutlet var button: UIButton!
    var game:Game! = nil
    var statementArray:[Statement] = []
    var data:AnyObject! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad();
        scoreLabel.text = "0"
        var p1:Player = Globals.getPlayerFromID(Globals.me)
        var p2:Player = Globals.getPlayerFromID(Globals.me)
        //label.text = data.first_name
        game = Game(p1:p1, p2:p2, gameViewController: self)
        game.createRound()
        
        
        setUpQuestion()
    }
    
    func setUpQuestion() {
        var index = game.currentQuestion
        var question = game.getCurrentQuestion()
        
        statementArray = [question.bif1, question.bif2, question.fib]
        statementArray = game.shuffle(statementArray)
        label1.setTitle(statementArray[0].text, forState: UIControlState.Normal)
        label2.setTitle(statementArray[1].text, forState: UIControlState.Normal)
        label3.setTitle(statementArray[2].text, forState: UIControlState.Normal)
        
    }
    
    func getStatement(button: UIButton) -> Statement? {
        for statement in statementArray {
            if (statement.text == button.titleLabel?.text) {
                return statement
            }
        }
        return nil
    }
    
    @IBAction func click(sender: UIButton) {
        game.answerQuestion(getStatement(sender)!)
       // game.endRound()
        
        if(game.currentQuestion < 5) {
            scoreLabel.text = String(game.currentPlayer.roundScore)
            setUpQuestion()
        }
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
        let gameOverView = self.storyboard?.instantiateViewControllerWithIdentifier("GameOver") as GameOverViewController
        gameOverView.status = status
        self.presentViewController(gameOverView, animated: true, completion: nil)
        
    }
    
}
