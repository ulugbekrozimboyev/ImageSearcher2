//
//  PhotoTableViewCell.swift
//  ImageSearcher2
//
//  Created by Ulugbek on 11/14/16.
//  Copyright © 2016 Ulugbek. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var indexOfCall = 0
    
    var photoData: Photo? {
    
        didSet {
            self.mainImage.image = nil
            
            guard let photoData = self.photoData else {
                return
            }
            let indexNow = indexOfCall
            
            RequestManager.sharedInstance.getImageByURL(urlOfImage: photoData.url!) { [weak self] (image, error) -> Void in
                
                if let error = error {
                    print(error)
                } else if self?.indexOfCall == indexNow {
                
                    DispatchQueue.main.async {
                        
                        self!.mainImage.image = image
                        self!.activityIndicator.stopAnimating()
                        
                    }
                
                }
                
                
            
            }
            
        }
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.activityIndicator.startAnimating()
        self.indexOfCall += 1
        self.mainImage = nil
    }

}
