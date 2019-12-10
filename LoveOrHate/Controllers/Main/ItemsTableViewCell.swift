//
//  ItemsTableViewCell.swift
//  LoveAndHate
//
//  Created by Bleysus on 19.11.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit
import SwipeCellKit

class ItemsTableViewCell: SwipeTableViewCell {

      
    @IBOutlet weak var itemPerson: UIButton!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var itemTextLabel: UILabel!
    @IBOutlet weak var itemHeartImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func selectPersonPressed(_ sender: UIButton) {
        itemTextLabel.text = "Yes!"      

        
    }
}

