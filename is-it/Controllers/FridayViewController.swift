//
//  FridayViewController.swift
//  is-it
//
//  Created by Maris Lagzdins on 16/12/2019.
//  Copyright © 2019 TestDevLab. All rights reserved.
//

import UIKit

class FridayViewController: UIViewController {
    @IBOutlet private var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: .today)

        // Weekday units are the numbers 1 through n, where n is the number of days in the week. For example, in the Gregorian calendar (which is the default one), n is 7 and Sunday is represented by 1.
        // https://developer.apple.com/documentation/foundation/nsdatecomponents/1410442-weekday

        if components.weekday == 6 {
            answerLabel.text = "YES!"
            answerLabel.textColor = .systemGreen
        } else {
            answerLabel.text = "No"
            answerLabel.textColor = .systemOrange
        }
    }
}

