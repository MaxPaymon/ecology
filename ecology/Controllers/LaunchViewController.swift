//
//  ViewController.swift
//  ecology
//
//  Created by Maxim Skorynin on 16/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        ParseNews.parse() { isUpdate in
            if isUpdate {
                self.showNewsList()
            } else {
                let alert = UIAlertController(title: "Ecology news", message: "Sorry, but today the news list is empty", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.showNewsList()
                })
                alert.addAction(ok)
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func showNewsList() {
        guard let window = UIApplication.shared.delegate?.window else {return}
        DispatchQueue.main.async {
            window!.rootViewController = Storyboard.main.instantiateViewController(withIdentifier: Vc.mainNavigationController)
            window!.makeKeyAndVisible()
        }
    }
}

