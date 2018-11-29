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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if news != nil {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.text) as? TextNewsTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(news: news)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.link) as? LinkNewsTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(news: news)
                return cell
            }
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            guard let url = URL(string: news.link) else { return }
            UIApplication.shared.open(url)
        }
    }
}
