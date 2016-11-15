//
//  Photo.swift
//  ImageSearcher2
//
//  Created by Ulugbek on 11/14/16.
//  Copyright © 2016 Ulugbek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Photo {
    let url: String?
    
    let likes: Int?
    
    let favorites: Int?
    
    init(json: JSON) {
        self.url = json["webformatURL"].string
        self.likes = json["likes"].int
        self.favorites = json["favorites"].int
    }
    
}
