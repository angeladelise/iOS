//
//  ViewController.swift
//  HW2
//
//  Created by Angela Delise on 9/13/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonClicked(sender: AnyObject) {
        let date:NSDate = datePicker.date
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        label.text = "The day is \(formatter.stringFromDate(date))"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

