//
//  bar.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/23/16.
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
        
    }
}