//
//  ViewController.swift
//  Fib
//
//  Created by Fib team on 2/7/15.
//  Copyright (c) 2015 hackbeanpot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
        
        
    }
    
    // Parse method
    
    func fetchFromParse(id: String, cb: (PFObject) -> ()) {
        var query = PFQuery(className: "Player")
        query.whereKey("id", equalTo: id)
        var player = query.getFirstObject()
        if (player == nil) {
            var me = PFObject(className: "Player")
            me["id"] = id
            me.setObject([], forKey: "statements")
            me.setObject([], forKey: "games")
            me.save()
            println(me)
        }
        else
        {
            println("not nil")
        }
        println(id)
    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as UIViewController;
        self.presentViewController(mainView, animated: true, nil)
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
        if (Globals.me == nil) {
            Globals.me = user
        }
        fetchFromParse(user.objectID, cb)
    }
    
    func cb(player: PFObject) {
        println("I GOT HERE")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
