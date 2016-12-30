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
    func getImageByName(nameToSearch name: String, completionHandler: @escaping (_ listOfPhotos: [Photo]? , _ error: Error?) -> Void ) {
        let parametrs: [String: Any] = ["key": API.apiKey, "q" : name]
        
        Alamofire.request(API.baseURL, parameters: parametrs).responseJSON { response in
            
            switch(response.result) {
            case .success(let value):
                let json = JSON(value)
                var photos = [Photo]()
                
                if let hits = json["hits"].array {
                    for item in hits {
                        photos.append(Photo(json: item))
                    }
                }
                
                completionHandler(photos, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }

    
    
    func getEditorChoicesImage(completionHandler: @escaping (_ listOfPhotos: [Photo]?, _ error: Error?) -> Void) {
        
        let parametrs: [String: Any] = ["key": API.apiKey, "editors_choice": true]
        
        Alamofire.request( API.baseURL, parameters: parametrs).responseJSON { response in
            
            switch(response.result) {
            case .success(let value):
                let json = JSON(value)
                var photos = [Photo]()
                
                if let hits = json["hits"].array {
                    for item in hits {
                        photos.append(Photo(json: item))
                    }
                }
                
                completionHandler(photos, nil)
                
            case .failure(let error):
                print(error)
                completionHandler(nil, error)
            }
            
        }
    }
    
    
    
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
    
    func getImageByURL(urlOfImage url: String, completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> Void ){
        
        Alamofire.request(url).responseImage { response in
            
            switch(response.result) {
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                print("error")
                print(error)
            }
            
        }
    }

}
