//
//  ViewController.swift
//  UI
//
//  Created by Angela Delise on 10/25/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let items:[[String]] = [
        ["A1", "A2", "A3"],
        ["B1", "B2"],
        ["C1"]
    ]
    
    @IBAction func button2(_ sender: AnyObject) {
    }
    @IBOutlet weak var label: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label1:UILabel = UILabel(frame: CGRect(x:20, y:40, width:300, height:30))
        label1.text = "from code!"
        view.addSubview(label1)
        
        let button:UIButton = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 40))
        button.setTitle("Code Button", for : .normal)
        button.backgroundColor = UIColor.darkGray
        button.addTarget(self, action: #selector(didClick), for: .touchUpInside)
        view.addSubview(button)
    }

    @IBAction func showAlert() {
        let alert:UIAlertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        
        let action1: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (_:UIAlertAction) in
            print("Cancelled")
        }
        alert.addAction(action1)
        self.present(alert, animated: true) {
            print("Present Complete")
        }
    }
    
    func didClick(btn:UIButton){
        btn.setTitle("Clicked", for: .normal)
        //print("Click")
    
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //number of columns
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //number of items in each sub array will determine number of rows
        return items[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //title of row is string inside array
        return items[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //change text of label to be row and column you selected
        label.text = items[component][row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

