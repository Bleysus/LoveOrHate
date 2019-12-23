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
    
    private func setTheme() {
        
                
        switch K.isDarkTheme {
        case true:
            viewBack.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            for label in textSettings {
                label.textColor = .white
            }
            textLoveorHate.textColor = .white
            
        case false:
            viewBack.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            for label in textSettings {
                label.textColor = .black
            }
            textLoveorHate.textColor = .black

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
        autoCloseLoveViewSwitch.isOn = K.isAutoClosingLoveChanger
        themeSwitch.isOn = K.isDarkTheme
        
        
        autoCloseLoveViewSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        themeSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
    }
    
    
    
    @objc func switchChanged(settingsSwitch: UISwitch) {
        switch settingsSwitch.tag {
        case 1:
            K.isAutoClosingLoveChanger = settingsSwitch.isOn //настройка автозакрытия окна любви
        case 2:
            K.isDarkTheme = settingsSwitch.isOn // настройка темы
        default:
            break
        }
        setTheme()
    }
    
    @IBAction func settinsButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
            break
        default:
            break
        }
    }
    
    func sendEmail(body: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["bleysus@gmail.com"])
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

