//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Delise on 9/20/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

enum modes {
    case NOT_SET
    case ADDITION
    case SUBTRACTION
    case MULTIPLICATION
}

class ViewController: UIViewController {
    
    var labelString:String = "0"
    var currentMode:modes = modes.NOT_SET
    var savedNum: Int = 0
    var lastButtonWasMode: Bool = false
    
    @IBOutlet weak var label: UILabel!
    @IBAction func tapped0(sender: AnyObject) {tappedNumber(0)}
    @IBAction func tapped1(sender: AnyObject) {tappedNumber(1)}
    @IBAction func tapped2(sender: AnyObject) {tappedNumber(2)}
    @IBAction func tapped3(sender: AnyObject) {tappedNumber(3)}
    @IBAction func tapped4(sender: AnyObject) {tappedNumber(4)}
    @IBAction func tapped5(sender: AnyObject) {tappedNumber(5)}
    @IBAction func tapped6(sender: AnyObject) {tappedNumber(6)}
    @IBAction func tapped7(sender: AnyObject) {tappedNumber(7)}
    @IBAction func tapped8(sender: AnyObject) {tappedNumber(8)}
    @IBAction func tapped9(sender: AnyObject) {tappedNumber(9)}
    
    @IBAction func tappedPlus(sender: AnyObject) {
        changeMode(modes.ADDITION)
    }
    @IBAction func tappedMinus(sender: AnyObject) {
        changeMode(modes.SUBTRACTION)
    }
    
    @IBAction func tappedMultiply(sender: AnyObject) {
        changeMode(modes.MULTIPLICATION)
    }
    
    @IBAction func tappedEquals(sender: AnyObject) {
        guard let num:Int = Int(labelString) else{
            return
        }
        if currentMode == modes.NOT_SET || lastButtonWasMode{
            return
        }
        
        if currentMode == modes.ADDITION {
            savedNum += num
        }
        else if currentMode == modes.SUBTRACTION{
            savedNum -= num
        }
        else if currentMode == modes.MULTIPLICATION{
            savedNum *= num
        }
        
        currentMode = modes.NOT_SET
        labelString = "\(savedNum)"
        
        if savedNum >= 1000000000000{
            label.text = "Number is too big! Clear Number"
        }
        else{
            updateText()
        }
        
        lastButtonWasMode = true
    }
    @IBAction func tappedClear(sender: AnyObject) {
        savedNum = 0
        labelString = "0"
        label.text = "0"
        currentMode = modes.NOT_SET
        lastButtonWasMode = false
    }
    
    func tappedNumber(num:Int){
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString = labelString.stringByAppendingString("\(num)")
        updateText()
    }
    
    func updateText(){
        guard let labelInt:Int = Int(labelString) else{
            label.text = "Number is too big! Clear Number"
            return
        }
        if currentMode == modes.NOT_SET{
            savedNum = labelInt
        }
        
        //creating an instance of NSNumberFormatter
        
        //instance of NSNumber class
        let formatter:NSNumberFormatter = NSNumberFormatter()
        //calling numberStyle and assigning it to other object decimal style
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        //create variable num of type NSNum and putting it through NSNum with labelInt, changing labelInt to NSNum type to put in right format
        let num:NSNumber = NSNumber(integer:labelInt)
        //then making label back into a string, labels can only be strings
        label.text = formatter.stringFromNumber(num)
        
    }
    
    func changeMode(newMode:modes){
        if savedNum == 0{
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
        
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

