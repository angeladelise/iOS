//
//  MenuViewController.swift
//  VideoEditor
//
//  Created by Ron Buencamino on 9/1/16.
//  Copyright © 2016 Roux Academy. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.backgroundView = nil
        self.tableView.backgroundColor = UIColor.darkGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

