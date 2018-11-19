//
//  News.swift
//  ecology
//
//  Created by Maxim Skorynin on 16/11/2018.
//  Copyright © 2018 Maxim Skorynin. All rights reserved.
//

import Foundation

class News {
    var date : String!
    var title : String!
    var shortDescription : String!
    var fullDescription : String!
    var pictureUrl : String!
    var croppedPictureUrl : String!
    var timestamp : Int!
    
    public init(title: String, shortDescription: String, fullDescription : String!, date: String, timestamp : Int, pictureUrl: String, croppedPictureUrl:String) {
        self.title = title
        self.date = date
        self.timestamp = timestamp
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
        self.pictureUrl = pictureUrl
        self.croppedPictureUrl = croppedPictureUrl
    }
}
