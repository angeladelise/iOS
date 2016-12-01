//
//  DetailViewController.swift
//  MakeupDictionary1
//
//  Created by Angela Delise on 11/29/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var terms = [["Foundation", "A foundation is makeup that serves as a base"],
                 ["Concealer", "provides more coverage in one area of the face"],
                 ["Powder", "is used to set the face"]]
    

    
    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
        
        //have the description change dependingon the row of the item selected
        
        detailDescriptionLabel.text = products[selectedRow][1]


//        if section == 0{
//        detailDescriptionLabel.text = terms[selectedRow][1]
//        }
//        
//        else if section == 1 {
//        detailDescriptionLabel.text = techniques[selectedRow][1]
//        }
//        
//        else if selectedRow == 2{
//        detailDescriptionLabel.text = products[selectedRow][1]
//        }
//            
//        else{
//        detailDescriptionLabel.text = tools[selectedRow][1]
//        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

