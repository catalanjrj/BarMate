//
//  barMenuViewViewController.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/23/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class barMenuViewViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var barMenuTableView: UITableView!
    
    var ref : FIRDatabaseReference = FIRDatabase.database().reference()
    var barMenuArray = [String]()
    var barMenuDict = [String:Drink]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.ref.removeAllObservers()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // retrive barMenus
    func bars(){
        self.ref.child("Bars").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) in
            guard snapshot.value != nil else{
                return
            }
            
            for (key,value)in snapshot.value as! [String:AnyObject]{
                
                
                self.barMenuArray.append(key)
                
                self.barMenuDict[key] = Drink(data: value as! [String : AnyObject])
            }
            
            dispatch_async(dispatch_get_main_queue(), {self.barMenuTableView.reloadData()})
            
        })
        
    }
    
    // MARK: - Table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("barMenuCell", forIndexPath: indexPath)as! drinkMenuTableCell
        
        // Configure the cell...
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
