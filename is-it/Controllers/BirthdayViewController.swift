//
//  BirthdayViewController.swift
//  is-it
//
//  Created by Maris Lagzdins on 16/12/2019.
//  Copyright © 2019 TestDevLab. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {
    private enum BirthdayError: Error {
        case incorrectDateFormat
        case futureDate
    }

    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()

    @IBOutlet private var birthdayTextField: UITextField!

    @IBAction private func birthdayButtonTapped(_ sender: Any) {
        let alertTitle: String
        let buttonTitle: String

        let stringDate = birthdayTextField.text ?? ""

        do {
            if try isTodayBirthday(stringDate) {
                alertTitle = "Woah, yes! Happy Birthday!"
                buttonTitle = "Thanks!"
            } else {
                alertTitle = "Haha, you wish, Today is not your birthday and you know it!"
                buttonTitle = "Ahh, right"
            }
        } catch {
            switch(error) {
            case BirthdayError.futureDate:
                alertTitle = "Such a date has not yet come"
                buttonTitle = "OK"

            default:
                alertTitle = "Ups, your date is in incorrect format"
                buttonTitle = "OK"
            }
        }

        let ac = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .default))

        present(ac, animated: true)
    }

    private func isTodayBirthday(_ date: String) throws -> Bool {
        let calendar = Calendar.current

        guard let birthday = formatter.date(from: date) else {
            throw BirthdayError.incorrectDateFormat
        }

        guard birthday <= .today else {
            throw BirthdayError.futureDate
        }

        let birthdayComponents = calendar.dateComponents([.day, .month], from: birthday)
        let todayComponents = calendar.dateComponents([.day, .month], from: .today)

        if birthdayComponents == todayComponents {
            return true
        }

        return false
    }
}

