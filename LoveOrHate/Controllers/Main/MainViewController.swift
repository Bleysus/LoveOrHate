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
    
    private func setTheme() {
        //Set Colors
        view.backgroundColor = .backgroudColor
        
        //-----
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }

    
    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlertButtonTapped(index: indexPath.row)
    }    
    
    func showAlertButtonTapped(index: Int) {
        currentLoveObject.currentLoves = itemsArray[index].loves
        currentLoveObject.currentHates = itemsArray[index].hates
        currentLoveObject.currentIndexPath = index
        currentLoveObject.currentImage = itemsArray[index].image

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: K.vcLoveChanger) as! LoveChangerViewController
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        myAlert.currentLoveObject = currentLoveObject
        myAlert.delegate = self
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func addNewLove(_ sender: UIBarButtonItem) {
        let newItem = (name: "Проведите влево для редактирования", image: "arrow.left", loves: 0, hates: 0, font: "Snell Roundhand")
        itemsArray.append(newItem)
        tableView.reloadData()
    }
    
}

extension MainViewController: LoveChangerViewControllerDelegate {
    func fetchChangedData(data: CurrentLoveObject) {
        itemsArray[data.currentIndexPath!].loves = data.currentLoves ?? 0
        itemsArray[data.currentIndexPath!].hates = data.currentHates ?? 0
        itemsArray[data.currentIndexPath!].image = data.currentImage ?? "person"
        
        tableView.reloadData()
    }
    }



