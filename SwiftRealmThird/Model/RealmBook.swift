//
//  RealmBook.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import Foundation
import RealmSwift

class RealmBook: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var author = ""
    dynamic var status = false
}
