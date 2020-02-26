//
//  SettingsViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 02.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var autoCloseLoveViewSwitch: UISwitch!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet var viewBack: UIView!
    @IBOutlet var textSettings: [UILabel]!
    @IBOutlet weak var textLoveorHate: UILabel!
    @IBOutlet weak var navbar: UINavigationItem!
    
    private func setTheme() {
        
        let colorMain = UIColor.gray
        var contrastColor = UIColor.white
                
        switch K.isDarkTheme {
        case true:
            viewBack.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            for label in textSettings {
                label.textColor = .white
            }
            textLoveorHate.textColor = .white
            contrastColor = UIColor.white
            
        case false:
            viewBack.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            for label in textSettings {
                label.textColor = .black
            }
            textLoveorHate.textColor = .black
            contrastColor = UIColor.black
        }
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: contrastColor]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: contrastColor]
        navigationController?.navigationBar.tintColor = contrastColor
        
        navBarAppearance.backgroundColor = colorMain
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navbar.standardAppearance = navBarAppearance
        navbar.scrollEdgeAppearance = navBarAppearance
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setTheme()
        
        autoCloseLoveViewSwitch.isOn = !K.isNotAutoClosingLoveChanger
        themeSwitch.isOn = K.isDarkTheme
        
        
        autoCloseLoveViewSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        themeSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
    }
    
    
    
    @objc func switchChanged(settingsSwitch: UISwitch) {
        let defaults = UserDefaults.standard
        
        switch settingsSwitch.tag {
        case 1:
            K.isNotAutoClosingLoveChanger = !settingsSwitch.isOn //настройка автозакрытия окна любви
            defaults.set(settingsSwitch.isOn, forKey: "isAutoClosingLoveChanger")
        case 2:
            K.isDarkTheme = settingsSwitch.isOn // настройка темы
            defaults.set(settingsSwitch.isOn, forKey: "isDarkTheme")
        default:
            break
        }
        setTheme()
    }
    
    @IBAction func feedbackPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1: //сложности
            break
        case 2: //ошибка
            sendEmail(body: "Нашел баги в программе: ")
        case 3: //предложения
            sendEmail(body: "Есть предложение новой фичи: ")
        case 4: //все отлично            
            let url = URL(string: "itms-apps://itunes.apple.com/app/id1500536744")!
            UIApplication.shared.open(url)
        default:
            break
        }
    }
    
    func sendEmail(body: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["novitskii.sergei.sergeevich@gmail.com"])
            mail.setSubject("APP: Love or Hate")
            mail.setMessageBody("Привет! \(body)", isHTML: true)
            
            present(mail, animated: true)
        } else {
            
        }
    }
}

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

