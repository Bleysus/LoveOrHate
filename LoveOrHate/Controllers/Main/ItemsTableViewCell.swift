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
    @IBOutlet weak var itemLoveValueLabel: UILabel!
    @IBOutlet weak var itemHateImage: UIImageView!
    @IBOutlet weak var itemHateValueLabel: UILabel!
    
    
    @IBOutlet weak var photoStack: UIStackView!
    @IBOutlet weak var loveStack: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        view.layer.borderWidth = 5
        view.layer.borderColor = .init(srgbRed: 0.13, green: 0.16, blue: 0.55, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        loveStack.addSubview(view)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func selectPersonPressed(_ sender: UIButton) {
        itemTextLabel.text = "Yes!"      

        
    }
}

