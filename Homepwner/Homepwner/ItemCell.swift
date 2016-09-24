//
//  ItemCell.swift
//  Homepwner
//
//  Created by Seab on 9/22/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let captionfont = UIFont.preferredFont(forTextStyle: .caption1)
        serialNumberLabel.font = captionfont
    }
    
    
}
