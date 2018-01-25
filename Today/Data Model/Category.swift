//
//  Category.swift
//  Today
//
//  Created by 張書涵 on 2018/1/17.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import RealmSwift

class Category:Object{
    @objc dynamic var name:String = ""
    let items = List<Item>()
    
}
