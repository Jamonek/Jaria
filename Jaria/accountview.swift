//
//  accountview.swift
//  Jaria
//
//  Created by Jamone Alexander Kelly on 5/13/15.
//  Copyright (c) 2015 Jaria. All rights reserved.
//

import UIKit
import Parse

class accountview : UIViewController {
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var fbButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupButton.backgroundColor = UIColor.clearColor()
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderColor = UIColor.whiteColor().CGColor
        signupButton.layer.borderWidth = 1
        signupButton.layer.masksToBounds = true
        signupButton.frame.size.height = 55
        signupButton.frame.size.width = 150
        
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.masksToBounds = true
        loginButton.frame.size.width = 150
        loginButton.frame.size.height = 55
        
        googleButton.backgroundColor = UIColor(red: 0.27, green: 0.52, blue: 0.94, alpha: 1.0)
        googleButton.layer.cornerRadius = 5
        googleButton.layer.borderColor = UIColor.clearColor().CGColor
        googleButton.layer.borderWidth = 1
        googleButton.layer.masksToBounds = true
        
        
        fbButton.backgroundColor = UIColor(red: 0.19, green: 0.38, blue: 0.63, alpha: 1.0)
        fbButton.layer.cornerRadius = 5
        fbButton.layer.borderColor = UIColor.clearColor().CGColor
        fbButton.layer.borderWidth = 1
        fbButton.layer.masksToBounds = true
        
        self.navigationItem.hidesBackButton = false
    }
    
    @IBAction func signupAction(sender: AnyObject) {
        var currentUser = PFUser.currentUser()
        if(currentUser == nil)
        {
            // user is not signed in.. move to sign up segue
            self.performSegueWithIdentifier("signupSeg", sender: self)
        } else {
            self.performSegueWithIdentifier("regToMain", sender: self)
        }
        
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        var currentUser = PFUser.currentUser()
        if(currentUser == nil)
        {
            // user is not signed in.. move to login segue
        } else {
            self.performSegueWithIdentifier("regToMain", sender: self)
        }
    }
    
    @IBAction func twitterLogin(sender: AnyObject) {
        var currentUser = PFUser.currentUser()
        if currentUser == nil
        {
            // User is not logged in.. 
            // Login with Twitter
            PFTwitterUtils.logInWithBlock {
                (user: PFUser?, error: NSError?) -> Void in
                if let user = user {
                    if user.isNew {
                        // Push to Alternate sign up view to complete details
                        println("User signed up and logged in with Twitter!")
                        self.performSegueWithIdentifier("signupSegTwit", sender: self)
                    } else {
                        // Push to Main segue
                        println("User logged in with Twitter!")
                         self.performSegueWithIdentifier("regToMain", sender: self)
                    }
                } else {
                    // figure this out..
                    println("Uh oh. The user cancelled the Twitter login.")
                }
            }
            
        } else {
            // User is logged in, 
            // link account to twitter
            if !PFTwitterUtils.isLinkedWithUser(PFUser.currentUser()) {
                PFTwitterUtils.linkUser(PFUser.currentUser()!, block: {(succeeded: Bool, error: NSError?) -> Void in
                    if PFTwitterUtils.isLinkedWithUser(currentUser) {
                        println("Woohoo, user logged in with Twitter!")
                        self.performSegueWithIdentifier("regToMain", sender: self)
                    }
                })
            }
            
        }
    }
    
    @IBAction func facebookLogin(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "signupSegTwit") {
            
            // not needed yet
        }
    }
}
