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
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }
    @IBAction func selectPersonPressed(_ sender: UIButton) {
        itemTextLabel.text = "Yes!"      

        
    }
}

//extension ItemsTableViewCell: SwipeTableViewCellDelegate {
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
//        guard orientation == .right else { return nil }
//        let deleteAction = SwipeAction(style: .destructive, title: "Удалить") { (action, index) in
//
//            //self.updateModel(at: indexPath)
//
//        }
//
//        deleteAction.image = UIImage(named: "Trash")
//        return [deleteAction]
//    }
//
    
//}
