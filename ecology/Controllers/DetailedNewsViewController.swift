//
//  DetailedNewsViewController.swift
//  ecology
//
//  Created by Maxim Skorynin on 17/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import UIKit

class DetailedNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleNews: UITextView!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var pictureNews: UIImageView!
    
    var news : News!
    let identCell = "TextNewsTableViewCell"
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        titleNews.text = news.title
        dateNews.text = news.date
        pictureNews.loadPhoto(url: news.pictureUrl)
        setLayouOptions()
    }
    
    func setLayouOptions() {
        self.view.layer.cornerRadius = 4
        self.title = "Новость в деталях"
        self.tableView.layer.cornerRadius = 8
        self.titleNews.sizeToFit()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if news != nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identCell) as? TextNewsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(news: news)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
