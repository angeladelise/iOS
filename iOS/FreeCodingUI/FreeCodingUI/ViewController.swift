//
//  ViewController.swift
//  FreeCodingUI
//
//  Created by Angela Delise on 10/27/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func alertMessage(_ sender: UIButton) {
        //each button is an action
        
        //create a type of UIAlert
        //two types of styles, .actionsheet (comes from bottom) and .alert (pops in middle)
        
        let alert:UIAlertController = UIAlertController(title: "ALERT TITLE", message: "You Pressed the Button!", preferredStyle: .alert)
        
        //then make an actions
        //handler is like sender, write code there
        let alertOkay:UIAlertAction = UIAlertAction(title: "Got it", style: .default) {(_:UIAlertAction) in
            print("okay pressed")
            self.myLabel.text = "Got it!"
            self.myLabel.textColor = UIColor.red
        }

        
        let alertCancel:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (_:UIAlertAction) in
            print("Alert pop up")
            self.myLabel.text = "Canceled"
            self.myLabel.textColor = UIColor.blue
        }
        
        let alertYes:UIAlertAction = UIAlertAction(title: "Yes", style: .default) { (_:UIAlertAction) in
            print("Alert pop up")
            self.myLabel.text = "YAYAYAYYSSS"
            self.myLabel.textColor = UIColor.purple
        }
        
        //add the actions to the alert, in order to show up
        alert.addAction(alertOkay)
        alert.addAction(alertCancel)
        alert.addAction(alertYes)
        
        //what occurs when pop up is on screen
        self.present(alert, animated: true){
            self.myLabel.text = "Make a choice"
            print("Completed")
        }
    }
    
    
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        
        //sender is the switch
        //if it is on (returns boolean) start activity indicator
        //if off then stop the animating
        
        if sender.isOn{
            myIndicator.startAnimating()
        }
        else{
            myIndicator.stopAnimating()
        }
        
    }
    
    @IBOutlet weak var Act1: UIActivityIndicatorView!
    @IBOutlet weak var Act2: UIActivityIndicatorView!
    @IBOutlet weak var Act3: UIActivityIndicatorView!
    @IBOutlet weak var Act4: UIActivityIndicatorView!
    
    
    @IBAction func mySegmentedControllerPressed(_ sender: UISegmentedControl) {
        
        //segment use index to refer to the location of the item in the segment bar
        
        let myIndex = sender.selectedSegmentIndex
        
//        if myIndex ==0 {
//        }else...
        
        //switch case
        //looks at value of the index
        switch myIndex {
        case 0:
            print("Selected \(myIndex)")
            Act1.startAnimating()
            Act2.stopAnimating()
            Act3.stopAnimating()
            Act4.stopAnimating()
        case 1:
            print("Selected \(myIndex)")
            Act2.startAnimating()
            Act1.stopAnimating()
            Act3.stopAnimating()
            Act4.stopAnimating()
        case 2:
            print("Selected \(myIndex)")
            Act3.startAnimating()
            Act2.stopAnimating()
            Act1.stopAnimating()
            Act4.stopAnimating()
        case 3:
            print("Selected \(myIndex)")
            Act4.startAnimating()
            Act2.stopAnimating()
            Act3.stopAnimating()
            Act1.stopAnimating()
        default:
            print("Selected Nothing")
            Act1.stopAnimating()
            Act2.stopAnimating()
            Act3.stopAnimating()
            Act4.stopAnimating()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

