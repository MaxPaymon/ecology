//
//  NewsTableViewController.swift
//  ecology
//
//  Created by Maxim Skorynin on 16/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    let identCell = "NewsCell"
    var allNews : [News] = []
    
    var refresher : UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 4
        
        let nib = UINib.init(nibName: identCell, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: identCell)
        
        allNews = ParseNews.globalNews
        
        refresher = UIRefreshControl()
        refresher.tintColor = UIColor.white.withAlphaComponent(0.8)
        refresher.addTarget(self, action: #selector(self.refresh), for: UIControl.Event.valueChanged)
        self.tableView.insertSubview(refresher!, at: 0)
        
    }
    
    @objc func refresh() {
        self.navigationItem.title = "Обновление..."
        ParseNews.parse() { isUpdate in
            if isUpdate {
                self.allNews = ParseNews.globalNews
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.navigationItem.title = "Новости экологии"
                    if self.refresher.isRefreshing {
                        self.refresher.endRefreshing()
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let news = allNews[indexPath.row] as News? {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identCell) as? NewsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(news: news)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNews.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailedNewsVC = self.storyboard?.instantiateViewController(withIdentifier: Vc.detailedNewsViewController) as? DetailedNewsViewController else {return}
        
        detailedNewsVC.news = allNews[indexPath.row]
        self.navigationController?.pushViewController(detailedNewsVC, animated: true)
    }
}
