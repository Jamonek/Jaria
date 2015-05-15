//
//  signup.swift
//  Jaria
//
//  Created by Jamone Alexander Kelly on 5/13/15.
//  Copyright (c) 2015 Jaria. All rights reserved.
//

import UIKit
import Parse

class signup : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    // Table View Data Source methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "First Name"
        case 1:
            cell.textLabel?.text = "Last Name"
        case 2:
            cell.textLabel?.text = "Email"
        default:
            cell.textLabel?.text = "Nothing"
        }
        return cell
    }
    
    // Table View Delegate methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
}
