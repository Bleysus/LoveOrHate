//
//  DataBase.swift
//  LoveOrHate
//
//  Created by Bleysus on 27.01.2020.
//  Copyright © 2020 Bleysus.com. All rights reserved.
//

import UIKit
import CoreData

class DataBase {
    
    static let shared = DataBase()
    private init() {
    }
    
    var itemsArray = [Item]()   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("unable to save \(error)")
        }
    }
    
    func loadData(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        do {
        itemsArray = try context.fetch(request)
        } catch {
            print("error reading data \(error)")
        }
    }

    func deleteData(at indexPath: IndexPath) {
        context.delete(itemsArray[indexPath.row])
        itemsArray.remove(at: indexPath.row)
        saveData()
    }

    func addItem(nameOfLove: String, symbolOfLove: String, hatesValue: Int32, lovesValue: Int32) {
        
        let newItem = Item(context: self.context)
        newItem.nameOfLove = nameOfLove
        newItem.symbolOfLove = symbolOfLove != "" ? symbolOfLove : "arrow.left" //хотя, пустым и не бывает...
        newItem.hatesValue = hatesValue
        newItem.lovesValue = lovesValue
        
        self.itemsArray.append(newItem)
        
        self.saveData()
    }
    
}
