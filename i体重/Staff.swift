//
//  Staff.swift
//  i体重
//
//  Created by Yutaka on 2015/03/05.
//  Copyright (c) 2015年 urayuta.com. All rights reserved.
//

import Foundation
import Realm

class Staff: RLMObject {
    dynamic var key = 0
    dynamic var name = "no name"
    override class func primaryKey() -> String! {
        return "key"
    }
    override class func attributesForProperty(propertyName: String!) -> RLMPropertyAttributes
    {
        var attributes = super.attributesForProperty(propertyName)
        if propertyName == "name" {
            attributes |= RLMPropertyAttributes.AttributeIndexed
        }
        return attributes
    }
}