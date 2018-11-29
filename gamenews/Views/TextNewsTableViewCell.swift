//
//  TextNewsTableViewCell.swift
//  ecology
//
//  Created by Maxim Skorynin on 20/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import UIKit

class TextNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!
    
    func configure(news : News) {
        self.textView.text = news.fullDescription
    }

}
