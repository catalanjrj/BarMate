//
//  Bar.swift
//  BarMate
//
//  Created by Jorge Catalan on 6/16/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

class Bar  {
    var barName = String()
     var barMenu =  [Drink]()
    
    
    
    init(orderData:[String:AnyObject]){
        
        
        barName = String(orderData["barName"]!)
        for (_,value) in (orderData["barMenu"] as? [String:AnyObject])!{
            barMenu.append(Drink(data: value as! [String : AnyObject]))
        }
        
//        user = String(orderData["user"]!)
//        image = String(orderData["image"]!)
//        orderId = String(orderData["orderId"]!)
//        uid = String(orderData["uid"]!)
        

}
}