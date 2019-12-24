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
    let emptyLoveObject = EmptyLoveObject()
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var penImage: UIImageView!
    
    @IBOutlet weak var viewForStack: UIView!
    @IBOutlet weak var viewForFrame: UIView!
    @IBOutlet weak var viewForItem: UIView!
    @IBOutlet weak var hatesLabel: UILabel!
    @IBOutlet weak var hatesPlusHeart: UIButton!
    @IBOutlet weak var hatesMinusHeart: UIButton!
    
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var lovesPlusHeart: UIButton!
    @IBOutlet weak var lovesMinusHeart: UIButton!
    
    @IBOutlet weak var editLoveTextField: UITextField!
    
    private func setTheme(isDarkTheme: Bool) {
        
        let viewBorder:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 534))
        viewBorder.layer.borderWidth = 2
        viewBorder.clipsToBounds = true
        viewBorder.layer.cornerRadius = 5
        
        
        
        switch K.isDarkTheme {
        case true:
            viewBorder.layer.borderColor = .init(srgbRed: 1, green: 1, blue: 1, alpha: 1.0)
            
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
            viewForStack.backgroundColor = .black
            penImage.tintColor  = .white
            itemImage.tintColor = .white
            lovesLabel.tintColor = .loveColor
            lovesPlusHeart.tintColor = .loveColor
            lovesMinusHeart.tintColor = .loveColor
            hatesLabel.textColor = .white
            hatesPlusHeart.tintColor = .white
            hatesMinusHeart.tintColor = .white
            
            
            
        case false:
            viewBorder.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1.0)
            
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
            viewForStack.backgroundColor = .white

            penImage.tintColor  = .black
            itemImage.tintColor = .black
            
            lovesLabel.tintColor = .loveColor
            lovesPlusHeart.tintColor = .loveColor
            lovesMinusHeart.tintColor = .loveColor
            hatesLabel.textColor = .black
            hatesPlusHeart.tintColor = .black
            hatesMinusHeart.tintColor = .black

        }
        
        viewForFrame.addSubview(viewBorder)
        
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLoveTextField.delegate = self
        
        setTheme(isDarkTheme: K.isDarkTheme)
                
        hatesLabel.text = String(currentLoveObject.currentHates ?? 0)
        lovesLabel.text = String(currentLoveObject.currentLoves ?? 0)
        itemImage.image = UIImage(systemName: currentLoveObject.currentImage ?? "person")
        
        if (currentLoveObject.currentName != "Проведите влево для редактирования") && (!emptyLoveObject.text.contains(currentLoveObject.currentName ?? "")) {
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
        
        if (editLoveTextField.text != "") {
            currentLoveObject.currentName = editLoveTextField.text
        } else if !emptyLoveObject.text.contains(currentLoveObject.currentName ?? "") {
            let random = Int(arc4random_uniform(UInt32(emptyLoveObject.text.count)))
            currentLoveObject.currentName = emptyLoveObject.text[random]
        }
            
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
