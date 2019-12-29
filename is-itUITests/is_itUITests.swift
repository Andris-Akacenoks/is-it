//
//  is_itUITests.swift
//  is-itUITests
//
//  Created by Andris Akačenoks on 24/12/2019.
//  Copyright © 2019 TestDevLab. All rights reserved.
//

import XCTest

class is_itUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func openApp() -> XCUIApplication {
        let app = XCUIApplication()
        app.launch()
        return app
    }

    /*
     Test cases
     */

    func testIsTodayFriday() {
        /*
         Test Case:
         1. Open application
         2. Click on the "Is it Friday?"
         3. Verify that the application shows answer "No"
         */

        let app = openApp()
        app.buttons["IsFriday"].tap()
        let isFridayValue = app.staticTexts["IsFridayLabel"].label
        XCTAssertEqual(isFridayValue, "No")
    }

    func testMyBirthdayIsNotToday() {
        /*
         Test Case:
         1. Open application
         2. Click on the "Is it my Birthday?"
         3. Type in the textfield "01.01.2000"
         4. Click on the "Is Today really my Birthday?"
         5. Verify that the alert with the label "Haha, you wish, Today is not your birthday and you know it!" appears (exists)
         6. Verify that the alert have the button title "Ahh, right"
         7. Click on the "Ahh, right"
         */

        let app = openApp()
        app.buttons["IsBirthday"].tap()
        app.textFields.element.tap()
        app.textFields.element.typeText("01.01.2000")
        app.buttons["IsBirthdayTodayBtn"].tap()
        let notBirthdayAlert = app.alerts["Haha, you wish, Today is not your birthday and you know it!"]
        XCTAssertTrue(notBirthdayAlert.exists)
        XCTAssertTrue(notBirthdayAlert.buttons["Ahh, right"].exists)
        notBirthdayAlert.buttons["Ahh, right"].tap()
    }

    func testIfTodayIsDayOff() {
        /*
         Test Case:
         1. Open application
         2. Click on the "Is it a day off?"
         3. Verify that the next screen shows the text "No, because you are writing UI tests for this app right now! 🤪 Keep working!"

         Note: For verification, please use "element(boundBy:)" method
         */

        let app = openApp()
        app.buttons["IsDayOff"].tap()
    }

    func testItIsAWunderfulDayToday() {
        /*
         Test Case:
         1. Open application
         2. Click on the "Is it a nice day Today?"
         3. Move the slider to the right end
         4. Verify that the text right below the slider shows "It was such an awesome day! :)"
         */

        let app = openApp()
        app.buttons["IsNiceDay"].tap()
    }

    func testTodaysMoodHave4AvailableValues() {
        /*
         Test Case:
         1. Open application
         2. Click on the "Is it a nice day Today?"
         3. Move the slider to 10%,      for example -O---------
         4. Verify that the text right below the slider shows "It was awful day!"
         5. Move the slider to 30%,     for example ---O-------
         6. Verify that the text right below the slider shows "It could been better"
         7. Move the slider to 50%,     for example -----O-----
         8. Verify that the text right below the slider shows "It was like every other day, nothing special"
         9. Move the slider to 70%,     for example -------O---
         10. Verify that the text right below the slider shows "It was wonderful day"
         11. Move the slider to 90%,    for example ---------O-
         12. Verify that the text right below the slider shows "It was such an awesome day! :)"
         */

        // Your code goes here
    }

    func testEachApplicationSection() {
        /*
         Test Case:
         1. Open application
         2. Click on the "Is it Friday?"
         3. Click the back button
         4. Click on the "Is it my Birthday?"
         5. Click the back button
         6. Click on the "Is it a day off?"
         7. Click the back button
         8. Click on the "Is it a nice day Today?"
         9. Click the back button
         */

        // Your code goes here
    }

    // ---------- Bonus test (not mandatory) ----------

    func testIsItFridayAnswersCorrectly() {
        /*
         Test Case:
         1. Open application
         2. Click on the "Is it Friday?"
         3. Verify that when Today is not Friday - app will answer "No", but if Today is Friday - it would answer "YES!"

         Note:
         1. You can change the Simulator's Date and Time by changing the Date and Time on your computer and after that restart the Simulator.
         2. Be aware that weekday units are the numbers 1 through n, where n is the number of days in the week. For example, in the Gregorian calendar (which is the default one), n is 7 and Sunday is represented by 1.
         https://developer.apple.com/documentation/foundation/nsdatecomponents/1410442-weekday
         */

        // Your code goes here
    }
}
