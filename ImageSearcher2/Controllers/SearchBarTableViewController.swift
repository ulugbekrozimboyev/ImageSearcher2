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
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...

        return cell
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }

}
