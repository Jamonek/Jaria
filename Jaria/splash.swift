//
//  splash.swift
//  Jaria
//
//  Created by Jamone Alexander Kelly on 5/7/15.
//  Copyright (c) 2015 Jaria. All rights reserved.
//

import UIKit

class splash: UIViewController {
    
    override func viewDidLoad() {
        let bg = UIImage(named: "background")
        self.view.backgroundColor = UIColor(patternImage: bg!)
    }
}