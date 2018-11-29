//
//  LinkNewsTableViewCell.swift
//  ecology
//
//  Created by Maxim Skorynin on 26/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import UIKit

class LinkNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var link: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(news : News) {
        self.link.text = news.link
    }
    
}
