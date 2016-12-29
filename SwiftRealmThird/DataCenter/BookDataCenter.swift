//
//  BookDataCenter.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit
import RealmSwift

struct BookDataCenter: BookDataProtocol {
    // 取值
    func getBooksFromDB() -> [Book] {
        let realm = try! Realm()
        let results = realm.objects(RealmBook.self)
        return mapResults(results)
    }
    func mapResults(_ results: Results<RealmBook>) -> [Book] {
        return results.map({
            Book(id: $0.id, name: $0.name, author: $0.author, status: $0.status)
        })
    }
    // 存值
    func saveBooksToDB() {
        for i in 0...9 {
            let realmBook = RealmBook(value: ["id": i, "name": "book - \(i)", "author": "author - \(i)", "status": false])
            addBookToDB(realmBook)
        }
    }
    func addBookToDB(_ book: RealmBook) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            try! realm.write {
                realm.add(book)
            }
        }
    }
    // 修改
    func changeStatusWithBook(id: Int, success: @escaping (_ book: Book) -> Void) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            if let realmBook = realm.objects(RealmBook.self).filter("id = %@", id).last {
                try! realm.write {
                    realmBook.status = !realmBook.status
                }
                let book = self.bookFromRealmBook(realmBook)
                DispatchQueue.main.async {
                    success(book)
                }
            }
        }
    }
    func bookFromRealmBook(_ realmBook: RealmBook) -> Book {
        return Book(id: realmBook.id, name: realmBook.name, author: realmBook.author, status: realmBook.status)
    }
}
