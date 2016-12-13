//
//  DetailViewController.swift
//  MakeupDictionary1
//
//  Created by Angela Delise on 11/29/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

var url1 = "http://www.google.com"
var url2 = "http://www.google.com"
var url3 = "http://www.google.com"

class DetailViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

        
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var item1: UIButton!
    
    @IBOutlet weak var item2: UIButton!
    @IBOutlet weak var item3: UIButton!
    
    @IBAction func item1pressed(_ sender: UIButton) {
        let url = URL(string: url1)!
        
        if UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        }
    }

    @IBAction func item2pressed(_ sender: UIButton) {
        let url = URL(string: url2)!
        
        if UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
            
        }
    }
    
    @IBAction func item3pressed(_ sender: UIButton) {
       let url = URL(string: url3)!
        
        if UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
    
            
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
        
        //have the description change dependingon the row of the item selected
        
        //detailDescriptionLabel.text = products[selectedRow][1]


        if sectionNumber == 0{
            header.text = terms[selectedRow][0]
            detailDescriptionLabel.text = terms[selectedRow][1]
            displayImage.image = UIImage(named: terms[selectedRow][2])
            item1.setTitle(terms[selectedRow][3], for: .normal)
            item2.setTitle(terms[selectedRow][5], for: .normal)
            item3.setTitle(terms[selectedRow][7], for: .normal)
            url1 = terms[selectedRow][4]
            url2 = terms[selectedRow][6]
            url3 = terms[selectedRow][8]
        }
        
        else if sectionNumber == 1 {
            header.text = techniques[selectedRow][0]

            detailDescriptionLabel.text = techniques[selectedRow][1]
            displayImage.image = UIImage(named: techniques[selectedRow][2])
            
            item1.setTitle(techniques[selectedRow][3], for: .normal)
            item2.setTitle(techniques[selectedRow][5], for: .normal)
            item3.setTitle(techniques[selectedRow][7], for: .normal)
            url1 = techniques[selectedRow][4]
            url2 = techniques[selectedRow][6]
            url3 = techniques[selectedRow][8]

        }
        
        else if sectionNumber == 2{
            header.text = products[selectedRow][0]

            detailDescriptionLabel.text = products[selectedRow][1]
            displayImage.image = UIImage(named: products[selectedRow][2])
            
            item1.setTitle(products[selectedRow][3], for: .normal)
            item2.setTitle(products[selectedRow][5], for: .normal)
            item3.setTitle(products[selectedRow][7], for: .normal)
            url1 = products[selectedRow][4]
            url2 = products[selectedRow][6]
            url3 = products[selectedRow][8]
            

        }
            
        else {
            header.text = tools[selectedRow][0]

            detailDescriptionLabel.text = tools[selectedRow][1]
            displayImage.image = UIImage(named: tools[selectedRow][2])
            
            item1.setTitle(tools[selectedRow][3], for: .normal)
            item2.setTitle(tools[selectedRow][5], for: .normal)
            item3.setTitle(tools[selectedRow][7], for: .normal)
            url1 = tools[selectedRow][4]
            url2 = tools[selectedRow][6]
            url3 = tools[selectedRow][8]

        }
        
    }
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
//        item1.addTarget(self, action: Selector("item1pressed"), for: .touchUpInside)
//        item2.addTarget(self, action: Selector("item2pressed"), for: .touchUpInside)
//        item3.addTarget(self, action: Selector("item3pressed"), for: .touchUpInside)

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

