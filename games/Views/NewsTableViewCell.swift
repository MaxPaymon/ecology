//
//  NewsTableViewCell.swift
//  ecology
//
//  Created by Maxim Skorynin on 16/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptioNews: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayoutOptions()
    }
    
    func setLayoutOptions() {
        viewCell.layer.cornerRadius = 9
        viewImage.layer.cornerRadius = 9
    }
    
    func configure(news : News) {
        self.picture.loadPhoto(url: news.croppedPictureUrl)
        self.title.text = news.title
        self.descriptioNews.text = news.shortDescription
        self.date.text = news.date
    }
}

extension UIImageView {
    func loadPhoto(url: String) {
        if !url.isEmpty {
            self.kf.setImage(with: URL(string: url), placeholder: nil, options: [.transition(ImageTransition.fade(0.5))], progressBlock: nil, completionHandler: nil)
        }
    }
}
