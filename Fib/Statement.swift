//
//  Statement.swift
//  Fib
//
//  Created by Vijay Pemmaraju on 2/7/15.
//  Copyright (c) 2015 James Yanyuk. All rights reserved.
//

import Foundation

class Statement {
    let type:Bool
    let text:String
    
    init(type:Bool, text:String) {
        self.type = type
        self.text = text
    }
}