//
//  barCellTableViewCell.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/23/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

class barCellTableViewCell: UITableViewCell {
    @IBOutlet weak var barCellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    func configureCell(bar:Bar){
        barCellLabel.text = bar.barName
    
    }
}
