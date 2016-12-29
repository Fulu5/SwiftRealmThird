//
//  DetailViewController.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookStatusLabel: UILabel!
    
    var bookDetailViewModel: BookDetailViewModel!
    var bookManager = BookDataCenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        configCellWithModel(bookDetailViewModel)
    }
    
    func configCellWithModel(_ bookDetail: BookDetailViewModel) {
        bookNameLabel.text = bookDetail.bookName()
        bookAuthorLabel.text = bookDetail.bookAuthor()
        bookStatusLabel.text = bookDetail.bookStatus()
    }

    @IBAction func statusButtonAction(_ sender: UIButton) {
        bookManager.changeStatusWithBook(id: bookDetailViewModel.bookID()) {
            [weak self] book in
            if let strongSelf = self {
                strongSelf.bookStatusLabel.text = book.statusText
            }
        }
    }
}
