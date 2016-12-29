//
//  UserHeaderTableViewCell.swift
//  SwiftRealmThird
//
//  Created by Guanxiong Cao  on 29/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class UserHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    func configCellWithUserInfo(_ userInfo: (name: String, bookCount: String)) {
        userName.text = userInfo.name
        countLabel.text = userInfo.bookCount
    }
}
