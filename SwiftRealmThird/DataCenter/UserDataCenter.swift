//
//  UserDataCenter.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import Foundation
import RealmSwift

struct UserDataCenter: UserDataProtocol {
    func getUserFromDB() -> User? {
        let realm = try! Realm()
        guard let realmUser = realm.objects(RealmUser.self).last else { return nil }
        return User(id: realmUser.id, name: realmUser.name, books: nil)
    }
    // 存储用户和用户拥有的书籍
    func saveUserToDB() {
        let realmUser = RealmUser(value: ["id": 0, "name": "Mr.Zombie"])
        for i in 0...9 {
            let realmBook = RealmBook(value: ["id": i, "name": "book -- \(i)", "author": "author - \(i)", "status": false])
            realmUser.books.append(realmBook)
        }
        DispatchQueue.global().async {
            let realm = try! Realm()
            try! realm.write {
                realm.add(realmUser)
            }
        }
    }
}
