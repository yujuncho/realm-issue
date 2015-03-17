//
//  model_inherit.swift
//  RealmBug
//
//  Created by Yujun Cho on 3/16/15.
//  Copyright (c) 2015 mychoices. All rights reserved.
//

import Foundation
import Realm

class ModelInherit: Model {
    
    dynamic var message: String = "Default"
    dynamic var waste: String = "Garbage"
    
    override class func primaryKey() -> String {
        return "uuid"
    }
    
    override class func ignoredProperties() -> [ AnyObject ]! {
        var base: [ AnyObject ] = super.ignoredProperties()
        base.append("waste")
        return base
    }
    
    override class var sharedRealmInstance: RLMRealm {
        struct Singleton {
            static let instance: Singleton = Singleton()
            
            var realm: RLMRealm = RLMRealm(path: NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)[0].stringByAppendingPathComponent("inherit"))
        }
        
        return Singleton.instance.realm
    }
}