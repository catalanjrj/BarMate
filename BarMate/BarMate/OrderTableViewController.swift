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
    // labels
    
    var objects = [String]()
    var ref : FIRDatabaseReference? = nil
    let username :FIRDatabaseReference? = nil
    var openOrderArray = [Order]()
    var completedOrderArray = [Order]()
    var fulfilledOrderArray = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(OrderTableViewController.insertNewObject(_:)))
       // self.navigationItem.rightBarButtonItem = addButton

  
        self.ref = FIRDatabase.database().reference()
        
               openOrders()
               completedOrders()
               fulfilledOrders()
        self.ref!.child("Orders").child("open")
        self.ref!.child("Orders").child("completed")
      self.ref!.child("Orders").child("fulfilled")
        //detects event changing will give event dictiolnary of what changed
        
    }
    
        func openOrders(){
        self.ref!.child("Orders/open/").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) in
            if  let openResponse = snapshot.value as? [String : AnyObject]{
                var  openOrderArray = [Order]()
                for openDict in openResponse.values{
                    openOrderArray.append(Order(orderData:openDict as! [String : AnyObject]))
                }
                self.openOrderArray = openOrderArray
            }
            
            dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})

        })
    }
    
        func completedOrders(){
        self.ref!.child("Orders/completed/").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) in
           if  let completedResponse = snapshot.value as? [String : AnyObject]{
                var  completedOrderArray = [Order]()
                for completedDict in completedResponse.values{
                    completedOrderArray.append(Order(orderData: completedDict as! [String:AnyObject]))
               }
            
            self.completedOrderArray =  completedOrderArray
            
           
          }
            dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
     
      })
       }
       func fulfilledOrders(){
        self.ref!.child("Orders/fulfilled/").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) in
        if  let fulfilledResponse = snapshot.value as? [String : AnyObject]{
            var  fulfilledOrderArray = [Order]()
                for fulfilledDict in fulfilledResponse.values{
                  fulfilledOrderArray.append(Order(orderData:fulfilledDict as! [String : AnyObject]))
             }
            self.fulfilledOrderArray = fulfilledOrderArray
            
           }
              dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
   })
    }
    
    
//    func insertNewObject(sender: AnyObject) {
//        
//        
//      
//      
//        objects.insert(uniqueString, atIndex: 0)
//        let  wordList = self.ref?.child("Users/Jorge/username").childByAutoId()
//        wordList?.setValue(uniqueString)
//        
//        
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0 )
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        
//    }


    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return openOrderArray.count
        case 1:
            return completedOrderArray.count
        case 2:
            return fulfilledOrderArray.count
            
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OrderCell", forIndexPath: indexPath)
        

        //cell.textLabel!.text = object
        return cell
    }
    
 override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let completed = UITableViewRowAction(style: .Normal, title: "completed") { action, index in
            print("completed button tapped")
    
            
        }
        completed.backgroundColor = UIColor.yellowColor()
    
        let fulfilled = UITableViewRowAction(style: .Normal, title: "fulfilled") { action, index in
            print("fulfilled button tapped")
        }
        fulfilled.backgroundColor = UIColor.greenColor()
        
    
        
    return [ completed, fulfilled]
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
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Open"
            
        case 1:
            return "Completed"
            
        case 2:
            return "Fulfilled"
            
        default:
            return "You should not be seeing this!"
        }
    }
    

    

//move data between buckets when item is tapped and confirmed 







//method is called when a button in the UI is clicked/tapped.
//@IBAction func itemsBoughtACTION(sender: AnyObject) {
//    
//    let rootRef = Firebase(url:"https://your-Firebase.firebaseio.com")
//    
//    let groceryRef = rootRef.childByAppendingPath("groceryLists")
//    
//    //get each child node of groceryRef where completed == true
//    groceryRef.queryOrderedByChild("completed").queryEqualToValue(true)
//        .observeEventType(.ChildAdded, withBlock: { snapshot in
//            
//            //set up a history node and write the snapshot.value to it
//            // using the key as the node name and the value as the value.
//            let historyNode = rootRef.childByAppendingPath("history")
//            let thisHistoryNode = historyNode.childByAppendingPath(snapshot.key)
//            thisHistoryNode.setValue(snapshot.value) //write to the new node
//            
//            //get a reference to the data we just read and remove it
//            let nodeToRemove = groceryRef.childByAppendingPath(snapshot.key)
//            nodeToRemove.removeValue();
//            
//        })
//    
//}





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