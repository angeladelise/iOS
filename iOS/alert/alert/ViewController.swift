//
//  ViewController.swift
//  alert
//
//  Created by Angela Delise on 10/25/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func button(_ sender: UIButton) {
        let alert:UIAlertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        
        let action1: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (_:UIAlertAction) in
            print("Cancelled")
        }
        
        let action2:UIAlertAction = UIAlertAction(title: "Delete", style: .destructive) { (_:UIAlertAction) in
            print("You deleted stuff")
        }
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true) {
            print("Present Complete")
        }
    }
    
    func didClick(btn:UIButton){
        btn.setTitle("Clicked", for: .normal)
        //print("Click")

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

