//
//  ViewController.swift
//  switch
//
//  Created by Angela Delise on 10/25/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        label.text = sender.titleForSegment(at: selectedIndex)
        
    }
   
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if !sender.isOn{
            myIndicator.stopAnimating()
        }
        else{
            myIndicator.startAnimating()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

