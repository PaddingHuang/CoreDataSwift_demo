//
//  ViewController.swift
//  coreDataTest
//
//  Created by HUA on 16/10/17.
//  Copyright © 2016年 HUA. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         PeopleTool.shared.deleteAllObjects()
//        PeopleTool.shared.savePeople(name: "陈正其", age: 23)
//        PeopleTool.shared.getPerson()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

