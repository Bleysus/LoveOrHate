//
//  ItemsTableViewController.swift
//  LoveAndHate
//
//  Created by Bleysus on 19.11.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    
    let itemsArray = [
    (name: "Обучение на электрогитаре", image: "guitars", loves: 24, hates: 12),
    (name: "Кодинг под iOS", image: "command", loves: 15, hates: 4),
    (name: "Игра в Overwatch", image: "gamecontroller", loves: 5, hates: 33),
    (name: "Работа на ОШЗ", image: "car", loves: 23, hates: 35)
    ]
    
    
    //let itemsArray = ["Обучение на электрогитаре", "Кодинг под iOS", "Играть в Overwatch"]
    //let imagesArray = ["guitars", "chevron.left.slash.chevron.right", "chevron.left.slash.chevron.right"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: K.itemsTableViewCellNib, bundle: nil), forCellReuseIdentifier: K.itemsTableViewCellIdentifier)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return itemsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.itemsTableViewCellIdentifier, for: indexPath) as! ItemsTableViewCell
        
        //cell.itemTextLabel.text = itemsArray[indexPath.row]
        //cell.itemPerson.setBackgroundImage(UIImage(systemName: imagesArray[indexPath.row]), for: .normal)
        cell.itemTextLabel.text = itemsArray[indexPath.row].name
        cell.itemPerson.setBackgroundImage(UIImage(systemName: itemsArray[indexPath.row].image), for: .normal)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlertButtonTapped(index: indexPath.row)
    }
    
    
    func showAlertButtonTapped(index: Int) {
        K.currentImage = itemsArray[index].image
        K.currentLoves = itemsArray[index].loves
        K.currentHates = itemsArray[index].hates
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "LoveChanger")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
