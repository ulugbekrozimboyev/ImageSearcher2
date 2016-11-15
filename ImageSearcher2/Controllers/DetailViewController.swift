//
//  DetailViewController.swift
//  ImageSearcher2
//
//  Created by Ulugbek on 11/15/16.
//  Copyright © 2016 Ulugbek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var numberOfLikes: UILabel!
    
    @IBOutlet weak var numberOfFavorites: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageSize = mainImage.bounds.size
        let widthScale = scrollView.bounds.width/imageSize.width
        let heightScale = scrollView.bounds.height/imageSize.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.zoomScale = minScale
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mainImage
    }
    
}
