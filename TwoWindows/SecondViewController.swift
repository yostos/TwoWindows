//
//  SecondViewController.swift
//  TwoWindows
//
//  Created by 吉田敏幸 on 2014/12/14.
//  Copyright (c) 2014年 Toshiyuki Yoshida. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {

   
   
    @IBOutlet weak var aLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    required init?(coder: (NSCoder!)) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear() {
        let aMessage = self.representedObject as Message
        aLabel.stringValue = aMessage.message
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissController(self)
    }
  
}
