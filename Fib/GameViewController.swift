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
    
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad();
        label.text = name
    }
    
}
