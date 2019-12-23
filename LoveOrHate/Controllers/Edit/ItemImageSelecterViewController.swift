//
//  ItemImageSelecterViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 20.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

struct CustomData {
    var name: String
}

protocol ItemImageSelecterViewControllerDelegate {
    func fetchImage(image: String)
}

class ItemImageSelecterViewController: UIViewController {
    
    var delegate: ItemImageSelecterViewControllerDelegate?
    var currentImage = ""
    
    let data = [
        CustomData(name: "paperplane"),
        CustomData(name: "archivebox"),
        CustomData(name: "doc"),
        CustomData(name: "calendar"),
        CustomData(name: "person"),
        CustomData(name: "clear"),
        CustomData(name: "globe"),
        CustomData(name: "sun.max"),
        CustomData(name: "moon"),
        CustomData(name: "cloud"),
        CustomData(name: "cloud.bolt"),
        CustomData(name: "wind"),
        CustomData(name: "snow"),
        CustomData(name: "tornado"),
        CustomData(name: "hurricane"),
        CustomData(name: "keyboard"),
        CustomData(name: "paperplane"),
        CustomData(name: "archivebox"),
        CustomData(name: "doc"),
        CustomData(name: "calendar"),
        CustomData(name: "person"),
        CustomData(name: "clear"),
        CustomData(name: "globe"),
        CustomData(name: "sun.max"),
        CustomData(name: "moon"),
        CustomData(name: "cloud"),
        CustomData(name: "cloud.bolt"),
        CustomData(name: "wind"),
        CustomData(name: "snow"),
        CustomData(name: "tornado"),
        CustomData(name: "hurricane"),
        CustomData(name: "keyboard"),
        CustomData(name: "paperplane"),
        CustomData(name: "archivebox"),
        CustomData(name: "doc"),
        CustomData(name: "calendar"),
        CustomData(name: "person"),
        CustomData(name: "clear"),
        CustomData(name: "globe"),
        CustomData(name: "sun.max"),
        CustomData(name: "moon"),
        CustomData(name: "cloud"),
        CustomData(name: "cloud.bolt"),
        CustomData(name: "wind"),
        CustomData(name: "snow"),
        CustomData(name: "tornado"),
        CustomData(name: "hurricane"),
        CustomData(name: "keyboard"),
    ]
    
    
    fileprivate let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                
                
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        //collectionView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        
        switch K.isDarkTheme {
        case true:
            view.backgroundColor = .black
            collectionView.backgroundColor = .black
            
        case false:
            view.backgroundColor = .white
            collectionView.backgroundColor = .white
        }
                
    }
}

extension ItemImageSelecterViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize: CGFloat = 0
        let screenWidth = view.frame.width
        
        switch screenWidth {
            case _ where screenWidth <= 320:
            cellSize = screenWidth / 3 - 15
            case _ where screenWidth > 320:
            cellSize = screenWidth / 4 - 15
        default:
            break
        }
        print(screenWidth)
        print(cellSize)
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        switch K.isDarkTheme {
        case true:
            cell.backgroundColor = .white
            cell.tintColor = .black
            
            
        case false:
            cell.backgroundColor = .black
            cell.tintColor = .white
        }
                
        
//        cell.backgroundColor = .black
//        cell.tintColor = .white
        cell.layer.cornerRadius = 10
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.fetchImage(image: self.data[indexPath.row].name)
        self.dismiss(animated: true, completion: nil)
    }
    
}

class CustomCell: UICollectionViewCell {
    var data: CustomData? {
        didSet {
            guard let data = data else {return}
            bg.image = UIImage(systemName: data.name)
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
