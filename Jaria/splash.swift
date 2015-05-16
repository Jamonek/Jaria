//
//  splash.swift
//  Jaria
//
//  Created by Jamone Alexander Kelly on 5/7/15.
//  Copyright (c) 2015 Jaria. All rights reserved.
//

import UIKit
import Parse

class splash: UIViewController {
    @IBOutlet var findButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // blur the image
        var blur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurView = UIVisualEffectView(effect: blur)
        blurView.frame = bgImage.bounds
        bgImage.addSubview(blurView)
        
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blur)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        blurView.contentView.addSubview(vibrancyView)
        
        
        findButton.backgroundColor = UIColor(red: 0.56, green:0.11, blue:0.04, alpha:1.0)
        findButton.layer.cornerRadius = 7
//        findButton.layer.borderWidth = 1
//        findButton.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }
    
    @IBAction func findAction(sender: AnyObject) {
        self.performSegueWithIdentifier("accountview", sender: self)
    }
}