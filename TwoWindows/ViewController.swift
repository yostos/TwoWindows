//
//  ViewController.swift
//  TwoWindows
//
//  Created by 吉田敏幸 on 2014/12/14.
//  Copyright (c) 2014年 Toshiyuki Yoshida. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var aMessage: Message!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aMessage.message = "Hello World"
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

