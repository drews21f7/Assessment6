//
//  GroupTableViewCell.swift
//  Assessment6
//
//  Created by Drew Seeholzer on 7/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var name1Label: UILabel!
    @IBOutlet weak var name2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        groupLabel.text = ""
        name1Label.text = ""
        name2Label.text = ""
    }

}
