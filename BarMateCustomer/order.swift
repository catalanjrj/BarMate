//
//  order.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/24/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import Foundation


class Order{
    var user: String
    var drink: String
    var orderTime: String
    var image: String?
    var orderId: String
    var uid: String
    
    init(orderData:[String:AnyObject]){
        
        
        drink = String(orderData["drink"]!)
        orderTime = String(orderData["orderTime"]!)
        user = String(orderData["user"]!)
        image = String(orderData["image"])
        orderId = String(orderData["orderId"]!)
        uid = String(orderData["uid"]!)
        
        
        
        
        //        // Set date format
        //        let dateFormat = NSDateFormatter()
        //dateFormat.timeZone = NSTimeZone.defaultTimeZone()
        //        dateFormat.dateFormat =  "yyyy-MM-dd"
        //      // Get NSDate for the given string
        //        _ = dateFormat.dateFromString(orderTime!)
        
        
        
        
        
    }
    
}