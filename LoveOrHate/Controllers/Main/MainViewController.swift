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
    
    private func setTheme() {
        //Set Colors
        view.backgroundColor = .systemBackground
        
        //-----
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        
        switch K.isDarkTheme {
        case true:
            loveTableView.backgroundImage = UIImage(named: "Wallpaper-Dark")
            //UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().backgroundColor = .white
           
            
        case false:
            loveTableView.backgroundImage = UIImage(named: "Wallpaper-Light")
            //UINavigationBar.appearance().tintColor = .black
            UINavigationBar.appearance().backgroundColor = .black
        }
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
       
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: K.vcLoveChanger) as! LoveChangerViewController
        vc.currentLoveObject = currentLoveObject
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func addNewLove(_ sender: UIBarButtonItem) {
        let newItem = (name: "Проведите влево для редактирования", image: "arrow.left", loves: 0, hates: 0, font: "Snell Roundhand")
        itemsArray.append(newItem)
        tableView.reloadData()
        let numberOfSections = tableView.numberOfSections
        let numberOfRows = tableView.numberOfRows(inSection: numberOfSections-1)
        let indexPath = IndexPath(row: numberOfRows-1, section: numberOfSections-1)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
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

extension UINavigationBar {
    class func setupAppearance() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .black
            appearance.titleTextAttributes = textAttributes
            appearance.largeTitleTextAttributes = textAttributes
            
            //self.appearance().standartAppearance = appearance
            
            
        } else {
            
            
        }
    }
}
