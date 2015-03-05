//
//  ViewController.swift
//  i体重
//
//  Created by Yutaka on 2015/03/05.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println(RLMRealm.defaultRealmPath())
        

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

