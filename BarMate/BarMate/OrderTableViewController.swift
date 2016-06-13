//
//  OrderTableViewController.swift
//  BarMate
//
//  Created by Jorge Catalan on 6/13/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class OrderTableViewController: UITableViewController {
    
    var objects = [String]()
    var ref : FIRDatabaseReference? = nil
    let drinkListRef :FIRDatabaseReference? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(OrderTableViewController.insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton

        
        self.ref = FIRDatabase.database().reference()
        
        
        self.ref!.child("Orders").child("Drink").setValue(["username": "Jorge"])
        //detects event changing will give event dictiolnary of what changed
        
        _ = self.ref!.child("users/Jorge/drinkList").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) in
            if  let postDict = snapshot.value as? [String : String]{
                self.objects = Array<String>(postDict.values)
                
                self.tableView.reloadData()
    }
        })
    }
    func insertNewObject(sender: AnyObject) {
        
        
        let rangOfInts = [Int](65...91)
        var rangeOfChars = rangOfInts.map{ value in
            return Character(UnicodeScalar(value))
        }
        var uniqueString = ""
        
        for _ in 1...6{
            let random = arc4random_uniform(UInt32 ( rangeOfChars.count))
            uniqueString.append(rangeOfChars[Int(random)])
            
        }
        objects.insert(uniqueString, atIndex: 0)
        let  wordList = self.ref?.child("users/Jorge/wordList").childByAutoId()
        wordList?.setValue(uniqueString)
        
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0 )
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
    }


    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OrderCell", forIndexPath: indexPath)
        
        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
}



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

