//
//  model.swift
//  RealmBug
//
//  Created by Yujun Cho on 3/16/15.
//  Copyright (c) 2015 mychoices. All rights reserved.
//

import Foundation
import Realm

protocol ModelItemType {
    class var sharedRealmInstance: RLMRealm { get }
}

class Model: RLMObject, Printable {

    dynamic var uuid: String = ""
    dynamic var name: String = ""
    dynamic var size: Int = 0
    dynamic var color: String = ""
    
    override class func primaryKey() -> String {
        return "uuid"
    }
    
    override class func ignoredProperties() -> [ AnyObject ]! {
        return [ "color" ]
    }
    
    class var sharedRealmInstance: RLMRealm {
        struct Singleton {
            static let instance: Singleton = Singleton()
            
            var realm: RLMRealm = RLMRealm(path: NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)[0].stringByAppendingPathComponent("model"))
        }
        
        return Singleton.instance.realm
    }
    
    class func transaction (block: () -> () ) -> () {
        self.sharedRealmInstance.beginWriteTransaction()
        block()
        self.sharedRealmInstance.commitWriteTransaction()
    }
    
    class func localList () -> RLMResults {
        return allObjectsInRealm(sharedRealmInstance)
    }
    
    func localCreate() {
        self.dynamicType.sharedRealmInstance.addObject(self)
    }
    
    func localUpdate() {
        self.dynamicType.sharedRealmInstance.addOrUpdateObject(self)
    }
    
    func localDelete() {
        self.dynamicType.sharedRealmInstance.deleteObject(self)
    }
}