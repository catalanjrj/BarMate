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
    var user: String
    var drink: String
    var orderTime: String

    var orderId: String
    var uid: String
    
    init(orderData:[String:AnyObject]){
        
        
        drink = String(orderData["drink"]!)
        orderTime = String(orderData["orderTime"]!)
        user = String(orderData["user"]!)

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