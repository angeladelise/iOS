//
//  DetailViewController.swift
//  NotesWithNoSegues
//
//  Created by Angela Delise on 10/20/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UITextView!

   
    //@IBOutlet weak var textView:

    func configureView() {
        // Update the user interface for the detail item.
       // if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = objects[currentIndex]
            }
       // }
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

    
    func textViewDidChange(_ textView: UITextView) {
        objects[currentIndex] = detailDescriptionLabel.text
    }
    
}




