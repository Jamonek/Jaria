//
//  signup.swift
//  Jaria
//
//  Created by Jamone Alexander Kelly on 5/13/15.
//  Copyright (c) 2015 Jaria. All rights reserved.
//

import UIKit
import Parse
import SingleLineShakeAnimation

class signup : UITableViewController, UITextFieldDelegate {
    @IBOutlet var signupBtn: UIButton!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var message: UILabel!
    let user = PFUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign Up"
        
        signupBtn.backgroundColor = UIColor.clearColor()
        signupBtn.layer.cornerRadius = 5
        signupBtn.layer.borderColor = UIColor.whiteColor().CGColor
        signupBtn.layer.borderWidth = 1
        signupBtn.layer.masksToBounds = true
        signupBtn.frame.size.height = 55
        signupBtn.frame.size.width = 150
        
        firstName.delegate = self
        lastName.delegate = self
        email.delegate = self
        password.delegate = self
        phoneNumber.delegate = self
    
    }
    
    @IBAction func signupSubmit(sender: AnyObject) {
        var stopSignup : Bool = false
        
        if firstName.text.isEmpty {
            firstName.shake(ShakeDirection.Horizontal)
            stopSignup = true
        }
        
        if lastName.text.isEmpty {
            lastName.shake(ShakeDirection.Horizontal)
            stopSignup = true
        }
        
        if email.text.isEmpty {
         email.shake(ShakeDirection.Horizontal)
            stopSignup = true
        }
        
        if password.text.isEmpty {
            password.shake(ShakeDirection.Horizontal)
            stopSignup = true
        }
        
        if phoneNumber.text.isEmpty {
            phoneNumber.shake(ShakeDirection.Horizontal)
            stopSignup = true
        }
        
        
        if !stopSignup {
            user.username = email.text
            user.email = email.text
            user.password = password.text
            user["firstName"] = firstName.text
            user["lastName"] = lastName.text
            user["phoneNumber"] = phoneNumber.text
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                    self.performSegueWithIdentifier("signInShowTab", sender: self)
                } else {
                    // Examine the error object and inform the user.
                    self.message.text = "There was an error during registration."
                }
            }
        } else {
            self.message.text = "There was a missing field."
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch textField {
        case self.firstName:
            lastName.becomeFirstResponder()
        case self.lastName:
            email.becomeFirstResponder()
        case self.email:
            password.becomeFirstResponder()
        case self.password:
            phoneNumber.becomeFirstResponder()
        case self.phoneNumber:
            phoneNumber.resignFirstResponder()
            // submit data
        default:
            textField.resignFirstResponder()
            
        }
        return true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            // 
            firstName.resignFirstResponder()
            lastName.resignFirstResponder()
            email.resignFirstResponder()
            password.resignFirstResponder()
            phoneNumber.resignFirstResponder()
        }
        super.touchesBegan(touches , withEvent:event)
    }
}
