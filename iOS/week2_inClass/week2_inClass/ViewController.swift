//
//  ViewController.swift
//  week2_inClass
//
//  Created by Angela Delise on 9/8/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myTextFieldOutlet: UITextField!
    
    @IBAction func button1Pressed(sender: UIButton) {
    }
    
    @IBOutlet weak var myNumberLabel: UILabel!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var mySliderOutlet: UISlider!
    
    @IBAction func sliderMoved(sender: UISlider) {
        
        let sliderValue = mySliderOutlet.value
        let myString = "\(sliderValue)"
            
        print("slider value is \(sliderValue)")
        
        myNumberLabel.text = myString
        
        myProgressView.progress = sliderValue
        
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

