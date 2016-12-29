//
//  BookListTableViewCell.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class BookListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configCellWithBook(_ book: Book) {
        nameLabel.text = book.name
        authorLabel.text = book.author
        statusLabel.text = book.statusText
    }
}
