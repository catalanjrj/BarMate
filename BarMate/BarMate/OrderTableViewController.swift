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
import FirebaseAuth
class OrderTableViewController: UITableViewController {
    // labels
    
    var label = [Order]()
    var ref : FIRDatabaseReference = FIRDatabase.database().reference()
    let username :FIRDatabaseReference? = nil
    var openOrderArray = [String]()
    var openOrderDict = [String:Order]()
    
    var completedOrderArray = [String]()
    var completedOrderDict = [String:Order]()
    
    var fulfilledOrderArray = [String]()
    var fulfilledOrderDict = [String:Order]()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        openOrders()
        completedOrders()
        fulfilledOrders()

        //  let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(OrderTableViewController.insertNewObject(_:)))
       // self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.ref.removeAllObservers()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
            }
    
    func openOrders(){
        self.ref.child("Orders/open/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildAdded, withBlock: {(snapshot) in
            guard snapshot.value != nil else{
                return
            }
            
            self.openOrderArray.append(snapshot.key)
            
            self.openOrderDict[snapshot.key] = Order(orderData: snapshot.value as! [String : AnyObject])
            
            
            dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
            
        })
        self.ref.child("Orders/open/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildRemoved, withBlock: {(snapshot) in
            self.openOrderDict.removeValueForKey(snapshot.key)
            let  openIndex =  self.openOrderArray.indexOf(snapshot.key)
            self.openOrderArray.removeAtIndex(openIndex!)
            
            dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
            
        })
    }
    
        func completedOrders(){
        self.ref.child("Orders/completed/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildAdded, withBlock: {(snapshot) in
            guard snapshot.value != nil else{
            return
            }
       
            self.completedOrderArray.append(snapshot.key)
            
            self.completedOrderDict[snapshot.key] = Order(orderData: snapshot.value as! [String : AnyObject])
              
            
            dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
     
      })
            
            self.ref.child("Orders/completed/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildRemoved, withBlock: {(snapshot) in
             self.completedOrderDict.removeValueForKey(snapshot.key)
               let  completedIndex =  self.completedOrderArray.indexOf(snapshot.key)
                self.completedOrderArray.removeAtIndex(completedIndex!)

                dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
                
            })
    }
                func fulfilledOrders(){
                self.ref.child("Orders/fulfilled/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildAdded, withBlock: {(snapshot) in
                    guard snapshot.value != nil else{
                        return
                    }
                    
                    
                    self.fulfilledOrderArray.append(snapshot.key)
                    
                    self.fulfilledOrderDict[snapshot.key] = Order(orderData: snapshot.value as! [String : AnyObject])
                    
                    
                    dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
                    
                })
               
                
                self.ref.child("Orders/fulfilled/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildRemoved, withBlock: {(snapshot) in
                    self.fulfilledOrderDict.removeValueForKey(snapshot.key)
                    let  fulfilledIndex =  self.fulfilledOrderArray.indexOf(snapshot.key)
                    self.fulfilledOrderArray.removeAtIndex(fulfilledIndex!)
                    
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

            let cell = tableView.dequeueReusableCellWithIdentifier("OrderCell", forIndexPath: indexPath) as! orderCell
        

        switch indexPath.section{
            
        case 0:
               let label = openOrderArray[indexPath.row]
               let order = openOrderDict[label]
         
            cell.userLabel.text! = order!.user
            cell.drinkLabel.text! = order!.drink
            cell.orderTimeLabel.text =  order!.orderTime
        case 1:
            let label = completedOrderArray[indexPath.row]
            let order = completedOrderDict[label]
            cell.userLabel?.text = order!.user
            cell.drinkLabel.text = order!.drink
            cell.orderTimeLabel.text = order!.orderTime
            
        case 2:
           let label =  fulfilledOrderArray[indexPath.row]
           let order = fulfilledOrderDict[label]
           
            cell.userLabel.text = order!.user
            cell.drinkLabel.text = order!.drink
            cell.orderTimeLabel.text = order!.orderTime
            
        default:
            return cell
            
        }

       return cell
//
       

    }
    
 override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let completedButton = UITableViewRowAction(style: .Normal, title: "completed") { action, index in
            print("completed button tapped")
            
           let openOrders = self.openOrderArray[indexPath.row]
            let order = self.openOrderDict[openOrders]
            

            
            self.ref.child("Orders").child("open").child(order!.uid).removeValue()
 
            
            let orderToMove = ["uid" :  order!.uid , "user" : order!.user, "drink": order!.drink, "orderTime": order!.orderTime,  "orderId": order!.orderId, "bar":"aowifjeafasg"]
            
            self.ref.child("Orders").child("completed").child(order!.uid).updateChildValues(orderToMove)
          

        }
        completedButton.backgroundColor = UIColor.orangeColor()
    
        let fulfilled = UITableViewRowAction(style: .Normal, title: "fulfilled") { action, index in
            print("fulfilled button tapped")
            
              let completedOrders = self.completedOrderArray[index.row]
              let order = self.completedOrderDict[completedOrders]
            
                 self.ref.child("Orders").child("completed").child(order!.uid).removeValue()
            
                 let orderToMove = ["uid" :  order!.uid , "user" : order!.user, "drink": order!.drink, "orderTime": order!.orderTime,  "orderId": order!.orderId, "bar":"aowifjeafasg"]
            
            self.ref.child("Orders").child("fulfilled").child(order!.uid).updateChildValues(orderToMove)
         
     }
        fulfilled.backgroundColor = UIColor.grayColor()
    
    return [completedButton, fulfilled]
    }
    
    
override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
    // make tableView cell Deselect after tapped
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    

    


   }