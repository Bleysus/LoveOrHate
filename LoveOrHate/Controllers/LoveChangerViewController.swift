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
    @IBOutlet weak var hatesPlusHeart: UIButton!
    @IBOutlet weak var lovesPlusHeart: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroudColor
        
        view.viewWithTag(1)?.backgroundColor = .red

        itemImage.tintColor = .photoColor
        
        lovesLabel.tintColor = .loveColor
        lovesPlusHeart.tintColor = .loveColor
                
        hatesLabel.tintColor = .hateColor
        hatesPlusHeart.tintColor = .hateColor
        
                
        itemImage.image = UIImage(systemName: K.currentImage)
        lovesLabel.text = String(K.currentLoves)
        hatesLabel.text = String(K.currentHates)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func heartButtonPressed(_ sender: UIButton) {
                        
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
    
    @IBAction func CloseButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
