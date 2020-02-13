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
    
    @IBOutlet weak var viewForFrame: UIView!
    @IBOutlet weak var viewForStack: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var hatesLabel: UILabel!
    @IBOutlet weak var hatesPlusHeart: UIButton!
    @IBOutlet weak var lovesPlusHeart: UIButton!
    
    private func setTheme() {
        let viewBorder:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 230, height: 425))
        viewBorder.layer.borderWidth = 2
        viewBorder.clipsToBounds = true
        viewBorder.layer.cornerRadius = 5
                
        switch K.isDarkTheme {
        case true:
            viewBorder.layer.borderColor = .init(srgbRed: 1, green: 1, blue: 1, alpha: 1.0)
            
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
            viewForStack.backgroundColor = .black
            itemImage.tintColor = .white
            lovesLabel.tintColor = .loveColor
            lovesPlusHeart.tintColor = .loveColor
            hatesLabel.textColor = .white
            hatesPlusHeart.tintColor = .white
        case false:
            viewBorder.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1.0)
            
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
            viewForStack.backgroundColor = .white
            itemImage.tintColor = .black            
            lovesLabel.tintColor = .loveColor
            lovesPlusHeart.tintColor = .loveColor
            hatesLabel.textColor = .black
            hatesPlusHeart.tintColor = .black

        }
        viewForFrame.addSubview(viewBorder)
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
        
        if !K.isNotAutoClosingLoveChanger {
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
