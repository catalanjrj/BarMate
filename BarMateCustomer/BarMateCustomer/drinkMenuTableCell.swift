//
//  drinkMenuTableCell.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/23/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

class drinkMenuTableCell: UITableViewCell {
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
func configureCell(drink:Drink){
   drinkNameLabel.text = drink.name
    drinkPricelabel.text =
}

