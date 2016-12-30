//
//  BookListViewModel.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import Foundation

struct BookListViewModel {
    var books: [Book]
    var user: User?
    
    init(books: [Book], user: User) {
        self.books = books
        self.user = user
    }
    func bookCount() -> Int {
        return books.count
    }
    func bookAtIndex(_ index: Int) -> Book {
        return books[index]
    }
    func userInfo() -> (name: String, bookCount: String) {
        return (name: user!.name, bookCount: "\(books.count) books in total")
    }
    mutating func setBooks(_ books: [Book]) {
        self.books = books
    }
}
