//
//  DetailViewController.swift
//  ImageSearcher2
//
//  Created by Ulugbek on 11/15/16.
//  Copyright © 2016 Ulugbek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var numberOfLikes: UILabel!
    
    @IBOutlet weak var numberOfFavorites: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
