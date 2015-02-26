//
//  FirstViewControllerTests.swift
//  ViewControllerTesting
//
//  Created by James Pang on 26/02/2015.
//  Copyright (c) 2015 James Pang. All rights reserved.
//

import UIKit
import XCTest
import ViewControllerTesting

class FirstViewControllerTests: XCTestCase {

    var viewController: FirstViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        let navigationController = storyboard.instantiateInitialViewController() as UINavigationController
        viewController = navigationController.topViewController as FirstViewController
        viewController.viewDidLoad()
    }
    
    func testCheckButtonHasTextNextScreen() {
        XCTAssertEqual(viewController.button.currentTitle!, "Next Screen", "Button should say Next Screen")
    }

}
