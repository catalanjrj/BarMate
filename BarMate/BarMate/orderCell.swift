//
//  orderCell.swift
//  BarMate
//
//  Created by Jorge Catalan on 6/20/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

class orderCell: UITableViewCell {
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var orderTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
