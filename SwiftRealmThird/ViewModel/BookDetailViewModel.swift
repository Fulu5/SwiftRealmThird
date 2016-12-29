//
//  BookDetailViewModel.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import Foundation

struct BookDetailViewModel {
    var book: Book
    func bookName() -> String {
        return book.name
    }
    func bookAuthor() -> String {
        return book.author
    }
    func bookStatus() -> String {
        return book.statusText
    }
}
