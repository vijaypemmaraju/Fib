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
    
    var activeUsers: [String] = []
    
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
        for i in 0 ..< data.count {
            let id = data[i]["id"]
            let displayStr = data[i].first_name + " " + data[i].last_name
            let user = (id, displayStr)
            activeUsers.append(displayStr)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeUsers.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.activeUsers[indexPath.row];
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell;
        
        cell.textLabel?.text = item;
        return cell;
    }
    
    
}