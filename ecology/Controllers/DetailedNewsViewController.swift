//
//  DetailedNewsViewController.swift
//  ecology
//
//  Created by Maxim Skorynin on 17/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import UIKit

class DetailedNewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleNews: UITextView!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var pictureNews: UIImageView!
    
    @IBOutlet weak var fullDescription: UITextView!
    var news : News!
    
    override func viewDidLoad() {
        titleNews.text = news.title
        dateNews.text = news.date
        pictureNews.loadPhoto(url: news.pictureUrl)
        fullDescription.text = news.fullDescription
        
        setLayouOptions()
    }
    
    func setLayouOptions() {
        
        fullDescription.sizeToFit()
        titleNews.sizeToFit()
        
        fullDescription.textContainerInset = UIEdgeInsets(top: 2, left: 8, bottom: 8, right: 8)

        titleNews.layoutIfNeeded()
        
        self.view.layer.cornerRadius = 4
        self.title = "Detiled news"
        self.tableView.layer.cornerRadius = 8
        self.titleNews.sizeToFit()
    }
}
