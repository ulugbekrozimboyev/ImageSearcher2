//
//  SearchBarTableViewController.swift
//  ImageSearcher2
//
//  Created by Ulugbek on 11/14/16.
//  Copyright © 2016 Ulugbek. All rights reserved.
//

import UIKit

class SearchBarTableViewController: UITableViewController, UISearchBarDelegate {
    
    var searchBarController: UISearchController!
    
    var dataSourceOfPhotos = [Photo](){
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var dataSourceOfSearch = [Photo](){
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.searchBarController = UISearchController(searchResultsController: nil)
        self.searchBarController.searchBar.delegate = self
        self.searchBarController.hidesNavigationBarDuringPresentation = true
        self.searchBarController.dimsBackgroundDuringPresentation = false
        self.searchBarController.searchBar.searchBarStyle = .minimal
        self.searchBarController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchBarController.searchBar
        self.searchBarController.definesPresentationContext = true
        
        RequestManager.sharedInstance.getEditorChoicesImage { [weak self]
            (listOfPhotos, error) in
            
            if error == nil {
                self?.dataSourceOfPhotos = listOfPhotos!
            }
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.searchBarController.isActive ? self.dataSourceOfSearch.count : self.dataSourceOfPhotos.count
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let destinationViewController = segue.destination as! DetailViewController
        let _ = destinationViewController.view
        
        guard  let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        
        let indexOfCellSelected = indexPath.row
        let cell = self.tableView.cellForRow(at: indexPath) as! PhotoTableViewCell
        
        destinationViewController.numberOfLikes.text = "\(self.dataSourceOfPhotos[indexOfCellSelected].likes!)"
        destinationViewController.numberOfFavorites.text = "\(self.dataSourceOfPhotos[indexOfCellSelected].favorites!)"
        destinationViewController.mainImage.image = cell.mainImage.image
        
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoTableViewCell
        
        
        if self.searchBarController.isActive {
            cell.photoData = self.dataSourceOfSearch[indexPath.row]
        } else {
            cell.photoData = self.dataSourceOfPhotos[indexPath.row]
        }
        
        return cell
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let textToFind = searchBar.text!
        
        RequestManager.sharedInstance.getImageByName(nameToSearch: textToFind) { (listOfPhotos, error) -> Void in
            if error == nil {
                self.dataSourceOfSearch = listOfPhotos!
                
            }
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dataSourceOfSearch = self.dataSourceOfPhotos
    }

}
