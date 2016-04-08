//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by lily on 4/7/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        // Set the text on th cell with description of the item that is at the nth index of items, where n = row
        // this cell will appear in the tableview
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
        
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
    
        
        return cell
    }
}
