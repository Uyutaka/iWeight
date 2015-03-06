//
//  Weight.swift
//  i体重
//
//  Created by Yutaka on 2015/03/06.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import Foundation
import Realm


class Weight : RLMObject {
    
    // モデルを定義
    dynamic var weight:Double = 0.0
    dynamic var date:String = ""
    
}