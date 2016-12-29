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
        return User(id: realmUser.id, name: realmUser.name)
    }
    func saveUserToDB() {
        let realmUser = RealmUser(value: ["id": 0, "name": "Mr.Zombie"])
        DispatchQueue.global().async {
            let realm = try! Realm()
            try! realm.write {
                realm.add(realmUser)
            }            
        }
    }
}
