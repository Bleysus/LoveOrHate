//
//  SettingsViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 02.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var autoCloseLoveViewSwitch: UISwitch!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }

    @IBAction func settinsButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

