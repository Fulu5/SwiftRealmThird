//
//  Book.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import Foundation

struct Book {
    let id: Int
    let name: String
    let author: String
    let status: Bool
    var owner: User?
}

extension Book {
    var statusText: String {
        return status ? "Available" : "Not Available"
    }
    var statusBtnTitle: String {
        return status ? "借阅" : "归还"
    }
}
