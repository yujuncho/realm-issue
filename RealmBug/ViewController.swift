//
//  ViewController.swift
//  RealmBug
//
//  Created by Yujun Cho on 3/16/15.
//  Copyright (c) 2015 mychoices. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var test = ModelInherit()
        test.uuid = "123456789"
        test.name = "Hello World"
        test.size = 20
        test.color = "Blue"
        ModelInherit.transaction {
            test.localCreate()
        }
        
        var grabTest: RLMResults = ModelInherit.localList()
        print("Contents of grabTest: ")
        println(grabTest)
        let grabbed = grabTest.firstObject()
        print("Decription: ")
        println(grabbed.description)
        println("**************")
        println(grabbed)
        println("**************")
        
        let g = grabbed as ModelInherit
        println("!!!!!!!!!!!!!!!")
        println(g)
        println("!!!!!!!!!!!!!!!")
        
        ModelInherit.transaction {
            test.localDelete()
        }
        
        print("Contents of grabTest: ")
        println(grabTest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

