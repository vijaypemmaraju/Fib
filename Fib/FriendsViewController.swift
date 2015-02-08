//
//  FriendsViewController.swift
//  Fib
//
//  Created by James Yanyuk on 2/7/15.
//  Copyright (c) 2015 hackbeanpot. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var userTable: UITableView!

    var activeUsers:[AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad();
        userTable.dataSource = self;
        userTable.delegate = self;
        populateActiveUsers();
    }
    
    func populateActiveUsers() {
        var completionHandler = {
            connection, result, error in self.populateUserTable(result.data)
        } as FBRequestHandler;
        
        // Request the profile info
        FBRequestConnection.startWithGraphPath(
            "me/friends?fields=installed,first_name,last_name",
            completionHandler: completionHandler
        );
    }
    
    func populateUserTable(data: AnyObject!) {
        for i in 0..<data.count {
            activeUsers.append(data[i])
        }
        userTable.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ToGame") {
            var destView = segue.destinationViewController as GameViewController
            var index = userTable.indexPathForSelectedRow()?.row
            destView.name = activeUsers[index!].first_name
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ToGame", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeUsers.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.activeUsers[indexPath.row];
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell;
        let displayStr = item.first_name + " " + item.last_name

        cell.textLabel?.text = displayStr;
        return cell;
    }
    
    
}