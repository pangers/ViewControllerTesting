//
//  SecondViewControllerTests.swift
//  ViewControllerTesting
//
//  Created by James Pang on 26/02/2015.
//  Copyright (c) 2015 James Pang. All rights reserved.
//

import UIKit
import XCTest
import ViewControllerTesting

class SecondViewControllerTests: XCTestCase {

    var secondViewController:SecondViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        secondViewController = storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as SecondViewController
        let _ = secondViewController.view
    }
    
    func testTextFieldIsBlank() {
        XCTAssertEqual(secondViewController.textField.text, "", "Nothing in textfield")
    }

}
