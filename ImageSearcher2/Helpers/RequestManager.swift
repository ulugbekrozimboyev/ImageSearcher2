//
//  RequestManager.swift
//  ImageSearcher2
//
//  Created by Ulugbek on 11/14/16.
//  Copyright © 2016 Ulugbek. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class RequestManager {

    // api settings
    private struct API {
        // api url
        static let baseURL = "https://pixabay.com/api/"
        // api key
        static let apiKey = "3738432-4df4d7cc3505aa0bf0d7f7b1d"
        
    }
    
    
    // shared instance to define the singleton
    static let sharedInstance = RequestManager()
    
    //privete init method to singleton
    private init(){
    }
    
    // rasm nomi bo'yicha qidirish
    func getImageByName(nameToSearch name: String) {
        let parametrs: [String: Any] = ["key": API.apiKey, "q" : name]
        
        Alamofire.request(API.baseURL, parameters: parametrs).responseJSON { response in
            
            switch(response.result) {
            case .success(let value): print(value)
            case .failure(let error): print(error)
            }
            
        }
    }

    
    
    func getEditorChoicesImage(completionHandler: @escaping (_ json: JSON?, _ error: Error?) -> Void) {
        
        let parametrs: [String: Any] = ["key": API.apiKey, "editors_choice": true]
        
        Alamofire.request( API.baseURL, parameters: parametrs).responseJSON { response in
            
            switch(response.result) {
            case .success(let value):
                let json = JSON(value)
                
                completionHandler(json, nil)
                
            case .failure(let error):
                print(error)
                completionHandler(nil, error)
            }
            
        }
    }
    
    
//    
//    func getEditorChoicesImage() {
//        let parametrs: [String: Any] = ["key": API.apiKey, "editors_choice": true]
//        
//        Alamofire.request( API.baseURL, parameters: parametrs).responseJSON { response in
//            
//            switch(response.result) {
//            case .success(let value):
//                let json = JSON(value)
//                
//                if let hits = json["hits"].array {
//                    print(hits.count)
//                    
//                    for item in hits {
//                        
//                        if let url = item["webformatURL"].string, let likes = item["likes"].int, let favorites = item["favorites"].int {
//                            
//                            let photo = Photo(url: url, likes: likes, favorites: favorites)
//                            
//                            print(photo)
//                            
//                        }
//                        
//                    }
//                    
//                }
//            case .failure(let error): print(error)
//            }
//            
//        }
//    }
    
    // rasmni idsi bo'yicha qidirish
    func getImageById(imageId id: String) {
        let parametrs: [String: Any] = ["key": API.apiKey, "id" : id]
        
        Alamofire.request(API.baseURL, parameters: parametrs).responseJSON { response in
            
            switch(response.result) {
            case .success(let value): print(value)
            case .failure(let error):
                print("error")
                print(error)
            }
            
        }
    }
    

}
