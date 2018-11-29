//
//  ParseNews.swift
//  ecology
//
//  Created by Maxim Skorynin on 16/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash

class ParseNews {
    
    static var globalNews : [News] = []
    
    static func formatTime(dateString: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="dd.MM.yyyy HH:mm"
        if let date = dateFormatter.date(from: dateString) {
            let timestamp:Int = Int(date.timeIntervalSince1970)
            return timestamp
        }
        return Int(Date().timeIntervalSinceNow)
    }
    
    public static func parse(completionHandler: @escaping (Bool) -> ()) {
        
        if globalNews.count > 0 {
            globalNews.removeAll()
        }
        
        Alamofire.request(Constants.url, method: .get).response(completionHandler: { response in
            if response.error == nil && response.data != nil {
                if let xml = SWXMLHash.parse(response.data!) as XMLIndexer? {
//                    print(xml)
                    let news = xml[Xml.news][Xml.item]
                    let countNews = news.all.count
//                    print(countNews)
                    for i in 0..<countNews {
                        
                        guard let dateString = String("\((news[i][Xml.date].element?.text)!) \((news[i][Xml.time].element?.text)!)") as String? else {
                            return
                        }
                        
                        let timestamp = formatTime(dateString: dateString)
                        let news = News(
                            title:(news[i][Xml.title].element?.text)!,
                            shortDescription: (news[i][Xml.shortdescription].element?.text)!,
                            fullDescription: (news[i][Xml.description].element?.text)!,
                            date: dateString, timestamp : timestamp,
                            pictureUrl: (news[i][Xml.picture].element?.text)!,
                            croppedPictureUrl: (news[i][Xml.croppedPicture].element?.text)!,
                            link: (news[i][Xml.source].element?.text)!)
                        globalNews.append(news)
                        
                    }
                    globalNews.sort {
                        return $0.timestamp > $1.timestamp
                    }
                    completionHandler(true)
                } else {
                    completionHandler(false)
                }
            } else {
                completionHandler(false)
                print("Error parse http", response.error!)
            }
        })
    }
    
}
