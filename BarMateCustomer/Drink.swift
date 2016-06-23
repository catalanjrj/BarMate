//
//  Drink.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/23/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

class Drink {
    var name = String()
    var image = String()
    var ingredients = String ()
    var price = Float()
    
    init() {
        name = ""
        image = ""
        ingredients = ""
        price = 0
        
    }
    init(data:[String:AnyObject]){
        
        name = String(data["name"])
        image = String(data["image"])
        ingredients = String(data["ingreditents"])
        price = data["price"] as! Float
        
        
}
}