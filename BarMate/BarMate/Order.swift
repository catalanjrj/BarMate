//
//  Order.swift
//  BarMate
//
//  Created by Jorge Catalan on 6/16/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase


class Order{
    var user = String()
    var drink = String()
    var orderTime = String()
    var image = String()
    var orderId = String()
    
    init(orderData:[String:AnyObject]){
        
        let data:[String:AnyObject]  = orderData //.values.first! as! [String : AnyObject]
        orderId = String(orderData.keys.first)
        orderTime = data["orderTime"] as! String
        user = String(data["user"])
        image = String(data["image"])
       orderId = String(data["orderId"])
        
        

        
//        // Set date format
        let dateFormat = NSDateFormatter()
dateFormat.timeZone = NSTimeZone.defaultTimeZone()
        dateFormat.dateFormat =  "yyyy-MM-dd"
      // Get NSDate for the given string   
        _ = dateFormat.dateFromString(orderTime)
        
        

        orderId = String(data["orderId"])
        
        
    }
    
}