//
//  ViewController.swift
//  Jaria
//
//  Created by Jamone Alexander Kelly on 5/7/15.
//  Copyright (c) 2015 Jaria. All rights reserved.
//

import UIKit
import Parse

class FindView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        var currentUser = PFUser.currentUser()
        if(currentUser == nil) {
            println("User is nil")
            // User is not logged in..
            // Present splash login screen
            self.performSegueWithIdentifier("splashSeg", sender: self)
        } else {
            // User is logged in.. present home view
            println("User is available")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

