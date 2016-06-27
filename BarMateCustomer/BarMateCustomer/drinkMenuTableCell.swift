//
//  drinkMenuTableCell.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/23/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

class drinkMenuTableCell: UITableViewCell {
    @IBOutlet weak var drinkPriceLabel: UILabel!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configurMenuCell(drink:Drink){
        
    drinkNameLabel.text! = drink.name
    drinkPriceLabel.text! = String(format:"$%.2f", drink.price)
    }
}


