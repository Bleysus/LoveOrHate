//
//  EditViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 03.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var hatesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
        itemImage.image = UIImage(systemName: CurrentLoveObject.currentImage ?? "person")
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func loveChangerPressed(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            if Int(hatesLabel.text!) ?? 1 < 9999 {
                hatesLabel.text = String(Int(hatesLabel.text!)! + 1) }
        case 11:
            if Int(hatesLabel.text!) ?? 1 > 0 {
                hatesLabel.text = String(Int(hatesLabel.text!)! - 1) }
        case 20:
            if Int(lovesLabel.text!) ?? 1 < 9999 {
                lovesLabel.text = String(Int(lovesLabel.text!)! + 1) }
        case 22:
            if Int(lovesLabel.text!) ?? 1 > 0 {
                lovesLabel.text = String(Int(lovesLabel.text!)! - 1) }
            
            
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.PhotoSelecterSegue {
            print("catch it!")
        }
    }
    
    
    @IBAction func DiscardButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            hatesLabel.text = "0"
        case 2:
            lovesLabel.text = "0"
        default:
            break
        }
    }
    
    @IBAction func CloseButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
