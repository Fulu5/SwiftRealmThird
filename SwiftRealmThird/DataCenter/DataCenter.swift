//
//  DataCenter.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import Foundation

enum NotificationType {
    case modifications(indics: [Int], results: [Book])
}

protocol UserDataProtocol {
    func getUserFromDB() -> User?
    func saveUserToDB()
}

protocol BookDataProtocol {
    mutating func getBooksFromDB(notiHandler: ((_ type: NotificationType) -> Void)?) -> [Book]
    func saveBooksToDB()
    func changeStatusWithBook(id: Int, success: @escaping (_ book: Book) -> Void)
}
