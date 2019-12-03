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
        cell.itemTextLabel.font = UIFont(name: itemsArray[indexPath.row].font, size: 50)
        
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func updateModel(at indexPath: IndexPath, action: String) {
        switch action {
        case "Edit":
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: K.vcEditLove)
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
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


