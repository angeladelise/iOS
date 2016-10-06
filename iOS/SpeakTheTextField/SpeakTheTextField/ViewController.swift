//
//  ViewController.swift
//  SpeakTheTextField
//
//  Created by Angela Delise on 9/29/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit
//for importing sounds
import AVFoundation

//speech synch
let mySpeechSynth = AVSpeechSynthesizer()

//hold rate value from slider
var rateFloat:Float = 0.5
let rateString = "0.5"

class ViewController: UIViewController {

    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBAction func sliderMoved(sender: AnyObject) {
        rateFloat = sender.value
        //convertin float to string for display
        rateLabel.text = String(rateFloat)
    }
    @IBAction func speakButtonPressed(sender: UIButton) {
        
        let usersText = myTextField.text
        
        //call the next function to speak
        speakThisString(usersText!)
        
       // print("The user typed \(usersText!)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func speakThisString(passedString:String){
        print("passedString is: \(passedString)")
        
        //utterance is a type
        let myUtterance = AVSpeechUtterance(string: passedString)
        
        //to change language
        myUtterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
        myUtterance.rate = rateFloat
        mySpeechSynth.speakUtterance(myUtterance)
    }

}

