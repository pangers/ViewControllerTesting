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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as UINavigationController
        viewController = navigationController.topViewController as FirstViewController
        let _ = viewController.view
        viewController.viewWillAppear(true)
    }
    
    func testCheckButtonHasTextNextScreen() {
        XCTAssertEqual(viewController.button.currentTitle!, "Next Screen", "Button should say Next Screen")
    }
    
    func testButtonIsEnabled() {
        XCTAssertTrue(viewController.button.enabled, "Button is not enabled")
    }

    func testXAfterShowingOnScreen() {
        XCTAssertEqual(viewController.x, 2, "Should be 2")
    }
    
    func testYAfterViewDidLoad() {
        XCTAssertEqual(viewController.y, 11, "Should be 11")
    }
    
    func testNavigationBarShowing() {
        XCTAssertFalse(viewController.navigationController!.navigationBarHidden, "Nav bar should be showing")
    }
}
