//
//  NiceDayViewController.swift
//  is-it
//
//  Created by Maris Lagzdins on 16/12/2019.
//  Copyright © 2019 TestDevLab. All rights reserved.
//

import UIKit

class NiceDayViewController: UIViewController {
    @IBOutlet private var moodLabel: UILabel!
    @IBOutlet private var moodSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderMoved(moodSlider)
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        switch sender.value {
        case 0.0..<0.2:
            moodLabel.text = "It was awful day!"
        case 0.2..<0.4:
            moodLabel.text = "It could been better"
        case 0.4..<0.6:
            moodLabel.text = "It was like every other day, nothing special"
        case 0.6..<0.8:
            moodLabel.text = "It was wonderful day"
        case 0.8...1.0:
            moodLabel.text = "It was such an awesome day! :)"
        default:
            break
        }
    }
}
