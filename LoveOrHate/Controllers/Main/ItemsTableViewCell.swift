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
    
    @IBOutlet weak var cellDividerLine: UIImageView!
    
    @IBOutlet weak var photoStack: UIStackView!
    @IBOutlet weak var loveStack: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let view:UIView = UIView(frame: CGRect(x: 0, y: 1, width: 78, height: 78))
//        view.layer.borderWidth = 2
//        view.layer.borderColor = .init(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 10
//        loveStack.addSubview(view)        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func selectPersonPressed(_ sender: UIButton) {
        //itemTextLabel.text = "Yes!"      

        
    }
}

