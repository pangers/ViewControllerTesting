//
//  FirstViewController.swift
//  ViewControllerTesting
//
//  Created by James Pang on 26/02/2015.
//  Copyright (c) 2015 James Pang. All rights reserved.
//

import UIKit

public class FirstViewController: UIViewController {

    @IBOutlet weak public var button: UIButton!
    
    public var x = 1
    public var y = 10
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        y = 11
        // Do any additional setup after loading the view.
    }
    
    public override func viewWillAppear(animated: Bool) {
        x = 2
    }

}
