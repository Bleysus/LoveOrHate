//
//  SwipeTableViewController.swift
//  MyToDo
//
//  Created by Bleysus on 15.11.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController {

    var currentLoveObject = CurrentLoveObject()
    
//        var itemsArray = [
//        (name: "Обучение на электрогитаре", image: "guitars", loves: 24, hates: 12, font: "Snell Roundhand"),
//        (name: "Кодинг под iOS.", image: "command", loves: 15, hates: 4, font: "Snell Roundhand"),
//        (name: "Игра в Overwatch", image: "gamecontroller", loves: 5, hates: 33, font: "Chalkduster"),
//        (name: "Работа на ОШЗ", image: "car", loves: 23, hates: 35, font: "Chalkduster")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .singleLine
        tableView.register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: K.itemsTableViewCellIdentifier)
        
        DataBase.shared.loadData()
    }
    
    //Table View Datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //itemsArray.count
        DataBase.shared.itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.itemsTableViewCellIdentifier, for: indexPath) as! ItemsTableViewCell
        
        //static
//        cell.itemTextLabel.text = itemsArray[indexPath.row].name
//        cell.itemPerson.setBackgroundImage(UIImage(systemName: itemsArray[indexPath.row].image), for: .normal)
//        cell.itemLoveValueLabel.text = String(itemsArray[indexPath.row].loves)
//        cell.itemHateValueLabel.text = String(itemsArray[indexPath.row].hates)
        //DB
        let DB = DataBase.shared.itemsArray[indexPath.row]
        
        cell.itemTextLabel.text = DB.nameOfLove
        cell.itemPerson.setBackgroundImage(UIImage(systemName: DB.symbolOfLove!), for: .normal)
        cell.itemLoveValueLabel.text = String(DB.lovesValue)
        cell.itemHateValueLabel.text = String(DB.hatesValue)
                
        //
        cell.itemHeartImage.tintColor = .loveColor
        cell.itemLoveValueLabel.textColor = .loveColor
        //border
        let view:UIView = UIView(frame: CGRect(x: 0, y: 2, width: 60, height: 56))
        view.layer.borderWidth = 2
        
        switch K.isDarkTheme {
            case true:
                view.layer.borderColor = .init(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            case false:
                view.layer.borderColor = .init(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            }
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        cell.loveStack.addSubview(view)
        
        //
        switch K.isDarkTheme {
        case true:
            cell.cellDividerLine.backgroundColor = .white
            cell.itemTextLabel.textColor = .white
            cell.itemPerson.backgroundColor = .white
            cell.itemPerson.tintColor = .black
            cell.itemHateImage.tintColor = .white
            cell.itemHateValueLabel.textColor = .white
            
        case false:
            cell.cellDividerLine.backgroundColor = .black
            cell.itemTextLabel.textColor = .black
            cell.itemPerson.backgroundColor = .black
            cell.itemPerson.tintColor = .white
            cell.itemHateImage.tintColor = .black
            cell.itemHateValueLabel.textColor = .black
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
            currentLoveObject.currentIndexPath = indexPath.row
            //static
//            currentLoveObject.currentLoves = itemsArray[indexPath.row].loves
//            currentLoveObject.currentHates = itemsArray[indexPath.row].hates
//            currentLoveObject.currentImage = itemsArray[indexPath.row].image
//            currentLoveObject.currentName = itemsArray[indexPath.row].name
            //DB
            let DB = DataBase.shared.itemsArray[indexPath.row]
            currentLoveObject.currentLoves = DB.lovesValue
            currentLoveObject.currentHates = DB.hatesValue
            currentLoveObject.currentImage = DB.symbolOfLove ?? "person"
            currentLoveObject.currentName = DB.nameOfLove ?? "Проведите влево для редактирования"
            
            //----
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: K.vcEditLove) as! EditViewController
            vc.currentLoveObject = currentLoveObject
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
            
            
        case "Delete":
            //itemsArray.remove(at: indexPath.row)
            DataBase.shared.deleteData(at: indexPath)
            
        default:
            break
        }
        
        tableView.reloadData()
        DataBase.shared.saveData()
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
        //static
//        itemsArray[data.currentIndexPath!].loves = data.currentLoves ?? 0
//        itemsArray[data.currentIndexPath!].hates = data.currentHates ?? 0
//        itemsArray[data.currentIndexPath!].image = data.currentImage ?? "person"
//        itemsArray[data.currentIndexPath!].name = data.currentName ?? "Проведите влево для редактирования"
        //DB
        let DB = DataBase.shared.itemsArray[data.currentIndexPath!]
        DB.lovesValue = data.currentLoves ?? 0
        DB.hatesValue = data.currentHates ?? 0
        DB.symbolOfLove = data.currentImage ?? "person"
        DB.nameOfLove = data.currentName ?? "Проведите влево для редактирования"
        
        tableView.reloadData()
        DataBase.shared.saveData()
    }
    
}


