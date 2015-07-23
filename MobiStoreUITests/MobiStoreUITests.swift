//
//  MobiStoreUITests.swift
//  MobiStoreUITests
//
//  Created by Iliyan Kafedzhiev on 6/22/15.
//  Copyright © 2015 MobiSystems. All rights reserved.
//

import Foundation
import XCTest

class MobiStoreUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCF() {
        // Use recording to get started writing UI tests.
        let app = XCUIApplication()
        let element = app.childrenMatchingType(.Window).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(2).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0)
        element.tap()
        app.staticTexts["OFFICESUITE"].tap()
        
        let oxfordDictionaryOfEnglishWithAudioStaticText = app.descendantsMatchingType(.Unknown)["article"].staticTexts["Oxford Dictionary of English with Audio"]
        oxfordDictionaryOfEnglishWithAudioStaticText.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        oxfordDictionaryOfEnglishWithAudioStaticText.swipeLeft()
        element.swipeLeft()
        app.staticTexts["Updated: 2014-12-19"].swipeLeft()
        app.staticTexts["REFERENCE"].tap()
        element.tap()
        app.descendantsMatchingType(.Unknown)["article"].childrenMatchingType(.Unknown).elementAtIndex(3).links["Buy Now €49.99 €24.99"].tap()
        element.swipeLeft()
        element.tap()
        app.descendantsMatchingType(.Unknown)["banner"].staticTexts["STORE"].tap()
        app.descendantsMatchingType(.Unknown)["banner"].staticTexts["SUPPORT"].tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test()
    {
        
    }
    
}
