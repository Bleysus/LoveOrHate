//
//  EditViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 03.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate {
    func fetchEditedData(data: CurrentLoveObject)
}

class EditViewController: UIViewController {

    var delegate: EditViewControllerDelegate?
    
    var currentLoveObject = CurrentLoveObject()
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var hatesLabel: UILabel!
    @IBOutlet weak var hatesPlusHeart: UIButton!
    @IBOutlet weak var hatesMinusHeart: UIButton!
    
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var lovesPlusHeart: UIButton!
    @IBOutlet weak var lovesMinusHeart: UIButton!
    
    @IBOutlet weak var editLoveTextField: UITextField!
    
    private func setTheme() {
        //view.backgroundColor = .backgroudColor
        //view.backgroundColor = .systemBackground
        
        //itemImage.tintColor = .photoColor
        itemImage.tintColor = .hateColor
        lovesLabel.tintColor = .loveColor
        lovesPlusHeart.tintColor = .loveColor
        lovesMinusHeart.tintColor = .loveColor
        hatesLabel.tintColor = .hateColor
        hatesPlusHeart.tintColor = .hateColor
        hatesMinusHeart.tintColor = .hateColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLoveTextField.delegate = self
        
        setTheme()
                
        hatesLabel.text = String(currentLoveObject.currentHates ?? 0)
        lovesLabel.text = String(currentLoveObject.currentLoves ?? 0)
        itemImage.image = UIImage(systemName: currentLoveObject.currentImage ?? "person")
        
        if currentLoveObject.currentName != "Проведите влево для редактирования" {
            editLoveTextField.text = currentLoveObject.currentName
        } else {
            editLoveTextField.placeholder = "Введите название для любви"
        }
        
        //скрыть клаву по тапу
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
        //-----
    }
    
    @IBAction func loveChangerPressed(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            if Int(hatesLabel.text!) ?? 1 < 999 {
                hatesLabel.text = String(Int(hatesLabel.text!)! + 1) }
        case 11:
            if Int(hatesLabel.text!) ?? 1 > 1 {
                hatesLabel.text = String(Int(hatesLabel.text!)! - 1) }
        case 20:
            if Int(lovesLabel.text!) ?? 1 < 999 {
                lovesLabel.text = String(Int(lovesLabel.text!)! + 1) }
        case 22:
            if Int(lovesLabel.text!) ?? 1 > 1 {
                lovesLabel.text = String(Int(lovesLabel.text!)! - 1) }
        default:
            break
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == K.PhotoSelecterSegue {
//            let vc = segue.destination as! PhotoSelecterViewController
//            vc.delegate = self
//        }
//    }
    
    @IBAction func DiscardButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Внимание!", message: "Обнулить значения?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отменить", style: .default, handler: { action in
        }))
        alert.addAction(UIAlertAction(title: "Обнулить", style: .destructive, handler: { action in
              switch sender.tag {
              case 1:
                self.hatesLabel.text = "0"
              case 2:
                self.lovesLabel.text = "0"
              default:
                  break
              }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func CloseButtonPressed(_ sender: UIButton) {
        currentLoveObject.currentHates = Int(hatesLabel.text ?? "1")
        currentLoveObject.currentLoves = Int(lovesLabel.text ?? "1")
        currentLoveObject.currentName = editLoveTextField.text
            
        self.delegate?.fetchEditedData(data: currentLoveObject)        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func ItemSelectButtonPressed(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: K.vcItemImageSelecter) as! ItemImageSelecterViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

extension EditViewController: ItemImageSelecterViewControllerDelegate {
    func fetchImage(image: String) {
        itemImage.image = UIImage(systemName: image)
        currentLoveObject.currentImage = image
    }
}
