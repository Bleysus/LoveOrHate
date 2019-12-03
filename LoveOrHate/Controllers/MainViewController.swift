//
//  ItemsTableViewController.swift
//  LoveAndHate
//
//  Created by Bleysus on 19.11.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit
import SwipeCellKit


class MainViewController: SwipeTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlertButtonTapped(index: indexPath.row)
    }    
    
    func showAlertButtonTapped(index: Int) {
        K.currentImage = itemsArray[index].image
        K.currentLoves = itemsArray[index].loves
        K.currentHates = itemsArray[index].hates
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: K.vcLoveChanger)
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
}
