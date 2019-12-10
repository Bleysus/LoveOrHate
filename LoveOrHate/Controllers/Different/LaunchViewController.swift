//
//  LaunchViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 03.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: K.vcNavController)
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            self.present(myAlert, animated: true, completion: nil)
        }
    }
}
