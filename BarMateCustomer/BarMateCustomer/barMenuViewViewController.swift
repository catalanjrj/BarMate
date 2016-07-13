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
    @IBOutlet weak var barNameLabel: UILabel!
    
    var ref : FIRDatabaseReference = FIRDatabase.database().reference()
    var barMenuArray = [String]()
    var barMenuDict = [String:Drink]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //present drinkReady Alert
        drinkReadyPopUp()
 

    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // remove observers when user leaves view 
        self.ref.removeAllObservers()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        bars()
    
    }
    
    // retrive barMenus
    func bars(){
        self.ref.child("Bars").child("aowifjeafasg").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) in
            guard snapshot.value != nil else{
                return
            }
            self.barMenuArray = [String]()
            self.barMenuDict = [String:Drink]()
            for (key,value)in snapshot.value!["barMenu"] as! [String:AnyObject]{
                
                
                self.barMenuArray.append(key)
                self.barMenuDict[key] = Drink(data: value as! [String:AnyObject])
          
    
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
        return barMenuArray.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("drinkMenuTableCell", forIndexPath: indexPath)as! drinkMenuTableCell
        let label = barMenuArray[indexPath.row]
        let bar = barMenuDict[label]
        
        
       cell.configurMenuCell(bar!)
        return cell
    }




    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "drinkDetailView"{
            if let indexPath = self.barMenuTableView.indexPathForSelectedRow{
                let object = barMenuArray[indexPath.row]
                
     
                
            let destinationViewController = segue.destinationViewController as! confirmOrderViewController
            
                destinationViewController.drink = barMenuDict[object]
            }
            
            
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    func barNameLabel(bar:Bar){
    barNameLabel.text = bar.barName
    
    }
    func drinkReadyPopUp(){
        _ = self.ref.child("Orders/completed/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildAdded, withBlock: {(snapshot) in
            
            
            if snapshot.value != nil{
                let drinkReadyAlert = UIAlertController(title:"Order Status", message: "Your order is ready for pick up!", preferredStyle: .Alert)
                let okAction = UIAlertAction(title:"Ok",style: .Default){(action) in
                }
                drinkReadyAlert.addAction(okAction)
                self.presentViewController(drinkReadyAlert, animated:true){}
                
                
            }else{
                
                return
                
            }
        })
    }

    


}
