//
//  Data.swift
//  Today
//
//  Created by 張書涵 on 2018/1/9.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation
import RealmSwift

class Data:Object{
    @objc dynamic var name:String = ""
    @objc dynamic var age:Int = 0
}
