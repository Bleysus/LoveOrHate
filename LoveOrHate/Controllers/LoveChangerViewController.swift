//
//  LoveChangerViewController.swift
//  LoveAndHate
//
//  Created by Bleysus on 20.11.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

class LoveChangerViewController: UIViewController {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var hatesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImage.image = UIImage(systemName: K.currentImage)
        lovesLabel.text = String(K.currentLoves)
        hatesLabel.text = String(K.currentHates)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButton(_ sender: UIButton) {
                        
        switch sender.tag {
        case 1:
            K.currentHates += 1
            hatesLabel.text = String(K.currentHates)
        case 2:
            K.currentLoves += 1
            lovesLabel.text = String(K.currentLoves)
        default: break
        }
        
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.dismiss(animated: true, completion: nil)
        })
        
    }
    
}
