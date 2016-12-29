//
//  DetailViewController.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookStatusLabel: UILabel!
    
    var bookDetailViewModel: BookDetailViewModel!

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
        
    }
}
