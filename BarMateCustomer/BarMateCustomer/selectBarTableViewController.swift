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
                self.barsArray = [String]()
                self.barsDict = [String:Bar]()
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
    

   


    
        
    }



    