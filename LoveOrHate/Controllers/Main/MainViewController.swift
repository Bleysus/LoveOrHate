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
    
    @IBOutlet var loveTableView: UITableView!
    
//    private func setTheme() {
//        //Set Colors
//        view.backgroundColor = .systemBackground
//
//        //-----
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setTheme()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        let color = UIColor.gray
        var contrastColor = UIColor.white
        
        
        switch K.isDarkTheme {
        case true:
            loveTableView.backgroundImage = UIImage(named: "Wallpaper-Dark")
            contrastColor = UIColor.white
            
        case false:
            loveTableView.backgroundImage = UIImage(named: "Wallpaper-Light")
            contrastColor = UIColor.black

        }
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: contrastColor]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: contrastColor]
        navigationController?.navigationBar.tintColor = contrastColor
        navBarAppearance.backgroundColor = color
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
    }
    
    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlertButtonTapped(index: indexPath.row)
    }    
    
    func showAlertButtonTapped(index: Int) {
        let DB = DataBase.shared.itemsArray[index]
        
        currentLoveObject.currentIndexPath = index
        currentLoveObject.currentLoves = DB.lovesValue
        currentLoveObject.currentHates = DB.hatesValue
        currentLoveObject.currentImage = DB.symbolOfLove
               
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: K.vcLoveChanger) as! LoveChangerViewController
        vc.currentLoveObject = currentLoveObject
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func addNewLove(_ sender: UIBarButtonItem) {
        DataBase.shared.addItem(nameOfLove: "Проведите влево для редактирования", symbolOfLove: "arrow.left", hatesValue: 0, lovesValue: 0)
        
        tableView.reloadData()
        let numberOfSections = tableView.numberOfSections
        let numberOfRows = tableView.numberOfRows(inSection: numberOfSections-1)
        let indexPath = IndexPath(row: numberOfRows-1, section: numberOfSections-1)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
}

extension MainViewController: LoveChangerViewControllerDelegate {
    func fetchChangedData(data: CurrentLoveObject) {
        let DB = DataBase.shared.itemsArray[data.currentIndexPath!]
        DB.lovesValue = data.currentLoves ?? 0
        DB.hatesValue = data.currentHates ?? 0
        DB.symbolOfLove = data.currentImage ?? "person"
        DB.nameOfLove = data.currentName ?? "Проведите влево для редактирования"
        
        
        tableView.reloadData()
        DataBase.shared.saveData()
    }
    }

extension UITableView {
    @IBInspectable var backgroundImage: UIImage? {
        get {
            return nil
        }
        set {
            backgroundView = UIImageView(image: newValue)            
        }
    }
}

//extension UINavigationBar {
//    class func setupAppearance() {
//        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        if #available(iOS 13.0, *) {
//            let appearance = UINavigationBarAppearance()
//            appearance.backgroundColor = .black
//            appearance.titleTextAttributes = textAttributes
//            appearance.largeTitleTextAttributes = textAttributes
//
//            //self.appearance().standartAppearance = appearance
//
//
//        } else {
//
//
//        }
//    }
//}

#warning("TODO: Пересмотреть все SFIcons")

#warning("TODO: Проверить иконки, перерисовать, если нужно, сделать иконку для APP Store")

#warning("TODO: Проверить работу тем на всех окнах")

#warning("TODO: Проверить корректное сохранение всех настроек")

#warning("TODO: Проверить корректность сохранения добавленной любви")

#warning("TODO: Сделать настройку первого запуска приложения")

#warning("TODO: При первом запуске добить пару-тройку элементов в список")

#warning("TODO: Разобраться с переходом в App Store по ссылке")

#warning("TODO: Отформатировать и добавить красивостей в текст ^О программе^")

#warning("TODO: Сделать отступы текста в ^О программе^")

#warning("TODO: Куда-нибудь добавить версию программы, например в настройки")

#warning("TODO: Сделать пасхалку - миниигру по десятикратному тапу по иконке любви")

#warning("TODO: Пофиксить смену цвета текста на navbar")
