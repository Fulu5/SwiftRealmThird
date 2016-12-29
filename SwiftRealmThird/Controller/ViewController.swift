//
//  ViewController.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let userCenter = UserDataCenter()
    var bookCenter = BookDataCenter()
    var viewModel: BookListViewModel!
    
    func bookStatusNotiHandler() -> (((_ type: NotificationType) -> Void)?) {
        return {
            [weak self] type in
            guard let strongSelf = self else { return }
            switch type {
            case .modifications(let modifications, let value):
                    strongSelf.viewModel.setBooks(value)
                    strongSelf.tableView.beginUpdates()
                    strongSelf.tableView.reloadRows(at: modifications.map({
                        IndexPath(row: $0, section: 0)
                    }), with: .automatic)
                    strongSelf.tableView.endUpdates()
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Books"
        
        let books = bookCenter.getBooksFromDB(notiHandler: bookStatusNotiHandler())
        let user = userCenter.getUserFromDB()
        viewModel = BookListViewModel(books: books, user: user!)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookCount()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookListCell", for: indexPath) as! BookListTableViewCell
        cell.configCellWithBook(viewModel.bookAtIndex(indexPath.row))
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userHeaderCell") as! UserHeaderTableViewCell
        cell.configCellWithUserInfo(viewModel.userInfo())
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = viewModel.bookAtIndex(indexPath.row)
        let bookDetail = BookDetailViewModel(book: book)
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.bookDetailViewModel = bookDetail
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

