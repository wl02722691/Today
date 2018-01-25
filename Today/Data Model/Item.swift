//
//  Item.swift
//  Today
//
//  Created by 張書涵 on 2018/1/17.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import RealmSwift

class Item:Object{
    @objc dynamic var title : String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated:Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
