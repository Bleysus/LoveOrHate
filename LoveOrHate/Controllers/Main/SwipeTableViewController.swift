//
//  SwipeTableViewController.swift
//  MyToDo
//
//  Created by Bleysus on 15.11.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit
import SwipeCellKit


//class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
class SwipeTableViewController: UITableViewController {

    var currentLoveObject = CurrentLoveObject()
    
        var itemsArray = [
        (name: "Обучение на электрогитаре", image: "guitars", loves: 24, hates: 12, font: "Snell Roundhand"),
        (name: "Кодинг под iOS.", image: "command", loves: 15, hates: 4, font: "Snell Roundhand"),
        (name: "Игра в Overwatch", image: "gamecontroller", loves: 5, hates: 33, font: "Chalkduster"),
        (name: "Работа на ОШЗ", image: "car", loves: 23, hates: 35, font: "Chalkduster")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: K.itemsTableViewCellIdentifier)
    }
    
    //Table View Datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.itemsTableViewCellIdentifier, for: indexPath) as! ItemsTableViewCell
        cell.itemTextLabel.text = itemsArray[indexPath.row].name
        cell.itemPerson.setBackgroundImage(UIImage(systemName: itemsArray[indexPath.row].image), for: .normal)
        //cell.itemTextLabel.font = UIFont(name: itemsArray[indexPath.row].font, size: 50)
        
        var itemCoefficient: Float = 0.0
        if itemsArray[indexPath.row].hates != 0 {
            itemCoefficient = round(100 * (Float(itemsArray[indexPath.row].loves) / Float(itemsArray[indexPath.row].hates))) / 100
        } else {
            itemCoefficient = 1
        }
        cell.itemCoefficientLabel.text = String(itemCoefficient)
        
        
        
        if itemCoefficient >= 1 {
            cell.itemHeartImage.tintColor = .loveColor
            
            cell.itemHeartImage.alpha = CGFloat(itemCoefficient / 5)
        } else {
            cell.itemHeartImage.tintColor = .hateColor
            
            switch itemCoefficient {
            case _ where itemCoefficient < 0.2:
                cell.itemHeartImage.alpha = 1
            case 0.2..<0.3 :
                cell.itemHeartImage.alpha = 0.9
            case 0.3..<0.4 :
                cell.itemHeartImage.alpha = 0.8
            case 0.4..<0.5 :
                cell.itemHeartImage.alpha = 0.7
            case 0.2..<0.6 :
                cell.itemHeartImage.alpha = 0.6
            case 0.2..<0.7 :
                cell.itemHeartImage.alpha = 0.5
            case 0.2..<0.8 :
                cell.itemHeartImage.alpha = 0.4
            case 0.2..<0.9 :
                cell.itemHeartImage.alpha = 0.3
            case _ where itemCoefficient > 0.9:
                cell.itemHeartImage.alpha = 0.2
            default:
                break
            }
            //cell.itemHeartImage.tintColor = .hateColor
            //cell.itemHeartImage.alpha = CGFloat(itemCoefficient + 0.1)
        }
        
        
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func updateModel(at indexPath: IndexPath, action: String) {
        switch action {
        case "Edit":
            //----
            currentLoveObject.currentLoves = itemsArray[indexPath.row].loves
            currentLoveObject.currentHates = itemsArray[indexPath.row].hates
            currentLoveObject.currentIndexPath = indexPath.row
            currentLoveObject.currentImage = itemsArray[indexPath.row].image
            currentLoveObject.currentName = itemsArray[indexPath.row].name
                            //----
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: K.vcEditLove) as! EditViewController
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            myAlert.currentLoveObject = currentLoveObject
            myAlert.delegate = self
            self.present(myAlert, animated: true, completion: nil)
        case "Delete":
            itemsArray.remove(at: indexPath.row)
        default:
            break
        }
        
        tableView.reloadData()
    }
    
}

extension SwipeTableViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let editAction = SwipeAction(style: .destructive, title: "Редактировать") { (action, index) in
            self.updateModel(at: indexPath, action: "Edit")
        }
        
        
        let deleteAction = SwipeAction(style: .destructive, title: "Удалить") { (action, index) in
            self.updateModel(at: indexPath, action: "Delete")
        }
        editAction.backgroundColor = .orange
        editAction.image = UIImage(systemName: "pencil")
        deleteAction.image = UIImage(systemName: "trash")
        
        return [deleteAction, editAction]
    }
}

extension SwipeTableViewController: EditViewControllerDelegate {
    func fetchEditedData(data: CurrentLoveObject) {
        itemsArray[data.currentIndexPath!].loves = data.currentLoves ?? 1
        itemsArray[data.currentIndexPath!].hates = data.currentHates ?? 1
        itemsArray[data.currentIndexPath!].image = data.currentImage ?? "person"
        itemsArray[data.currentIndexPath!].name = data.currentName ?? "Проведите влево для редактирования"
        tableView.reloadData()
    }
    
}


