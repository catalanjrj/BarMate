//
//  createUserProfileViewController.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/15/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

class createUserProfileViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        self.hideKeyboardWhenTappedAround()

        

    }

  

}
