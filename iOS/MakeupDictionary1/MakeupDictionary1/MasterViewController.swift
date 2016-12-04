//
//  MasterViewController.swift
//  MakeupDictionary1
//
//  Created by Angela Delise on 11/29/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    
    
    //comma and then file name to add images

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      //  self.navigationItem.leftBarButtonItem = self.editButtonItem

//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        self.navigationItem.rightBarButtonItem = addButton
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(_ sender: Any) {
//        objects.insert(NSDate(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        self.tableView.insertRows(at: [indexPath], with: .automatic)
//    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
               //let object = terms[indexPath.row][1]
               let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                //says its an NSDate
                //controller.detailItem = object
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return terms.count
        
        //break up into sections
        //the number of rows depends on the length of the array
        
        if section == 0{
            return terms.count
            
        }
            
        else if section == 1{
            return techniques.count
        }
            
        else if section == 2{
            return products.count
        }
            
        else {
            return tools.count
        }

    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        
        if indexPath.section == 0{
            let object = terms[indexPath.row][0]
            cell.textLabel!.text = object.description
            //detail of item in master view
            cell.detailTextLabel?.text = terms[indexPath.row][1]
            
        }

        else if indexPath.section == 1{
            //next array of information techniques
            let object = techniques[indexPath.row][0]
            cell.textLabel!.text = object.description
            //detail of item in master view
            cell.detailTextLabel?.text = techniques[indexPath.row][1]
        }
            
        else if indexPath.section == 2{
            //next array of information techniques
            let object = products[indexPath.row][0]
            cell.textLabel!.text = object.description
            //detail of item in master view
            cell.detailTextLabel?.text = products[indexPath.row][1]
        }
        
        else {
            //next array of information techniques
            let object = tools[indexPath.row][0]
            cell.textLabel!.text = object.description
            //detail of item in master view
            cell.detailTextLabel?.text = tools[indexPath.row][1]

        }
        
//        let object = objects[indexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
        
      

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get the row and section number of the selection!
        
        selectedRow = indexPath.row
        sectionNumber = indexPath.section
        
        //if you selected a row that is in a particular section then the output should be 
        //the terms in that arrays section
        
        //var sectionPath = NSIndexPath.index(ofAccessibilityElement: indexPath)
        print(sectionNumber, selectedRow)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return "myTitle"
        
        //break area into sections depending on type of section
        
        if section == 0{
            //sectionNumber = 0
            return "Terms"
        }
            
        else if section == 1{
           // sectionNumber = 1
            return "Techniques"
        }
            
        else if section == 2{
            //sectionNumber = 2
            return "Products"
        }
            
        else {
           // sectionNumber = 3
            return "Tools"
        }
    }

//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

