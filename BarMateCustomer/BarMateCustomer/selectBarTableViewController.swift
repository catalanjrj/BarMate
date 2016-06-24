//
//  selectBarTableViewController.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/23/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase


class selectBarTableViewController: UITableViewController {
    var ref : FIRDatabaseReference = FIRDatabase.database().reference()
    var barsArray = [String]()
    var barsDict = [String:Bar]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.ref.removeAllObservers()

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        bars()
    }
// retrive bars 
    func bars(){
            self.ref.child("Bars").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) in
                guard snapshot.value != nil else{
                    return
                }
                
                for (key,value)in snapshot.value as! [String:AnyObject]{
                
                
                  self.barsArray.append(key)
                
                self.barsDict[key] = Bar(orderData: value as! [String : AnyObject])
                }
                
                dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
                
            })
    
    }
   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return barsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("barCell", forIndexPath: indexPath)as! barCellTableViewCell
        let label = barsArray[indexPath.row]
        let bar = barsDict[label]
        
         cell.configureCell(bar!)


        return cell
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

}
