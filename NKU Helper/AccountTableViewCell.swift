//
//  AccountTableViewCell.swift
//  NKU Helper
//
//  Created by 陈乐天 on 15/3/5.
//  Copyright (c) 2015年 陈乐天. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var userIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}