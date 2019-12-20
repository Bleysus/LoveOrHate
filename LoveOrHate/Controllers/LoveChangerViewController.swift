//
//  LoveChangerViewController.swift
//  LoveAndHate
//
//  Created by Bleysus on 20.11.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

protocol LoveChangerViewControllerDelegate {
    func fetchChangedData(data: CurrentLoveObject)
}

class LoveChangerViewController: UIViewController {
    
    var delegate: LoveChangerViewControllerDelegate?
    
    var currentLoveObject = CurrentLoveObject()
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var hatesLabel: UILabel!
    @IBOutlet weak var hatesPlusHeart: UIButton!
    @IBOutlet weak var lovesPlusHeart: UIButton!
    
    private func setTheme() {
        //Set Colors
        //view.backgroundColor = .backgroudColor
        //view.backgroundColor = .systemBackground
        //view.viewWithTag(1)?.backgroundColor = .red
//        itemImage.tintColor = .photoColor
        itemImage.tintColor = .hateColor
        
        lovesLabel.tintColor = .loveColor
        lovesPlusHeart.tintColor = .loveColor
        hatesLabel.tintColor = .hateColor
        hatesPlusHeart.tintColor = .hateColor
        //-----
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
        hatesLabel.text = String(currentLoveObject.currentHates ?? 0)
        lovesLabel.text = String(currentLoveObject.currentLoves ?? 0)
        itemImage.image = UIImage(systemName: currentLoveObject.currentImage ?? "person")
                

    }
    

    @IBAction func heartButtonPressed(_ sender: UIButton) {
                        
        switch sender.tag {
        case 1:
            currentLoveObject.currentHates! += 1
            hatesLabel.text = String(currentLoveObject.currentHates ?? 0)
        case 2:
            currentLoveObject.currentLoves! += 1
            lovesLabel.text = String(currentLoveObject.currentLoves ?? 0)
        default: break
        }
        
        if K.isAutoClosingLoveChanger {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.exitLoveChanger()
            })
        }
    }
    
    @IBAction func CloseButtonPressed(_ sender: UIButton) {
        exitLoveChanger()
    }
    
    
    func exitLoveChanger() {
        self.delegate?.fetchChangedData(data: currentLoveObject)
        //self.view.removeFromSuperview()
        self.dismiss(animated: true, completion: nil)
    }
    
}
