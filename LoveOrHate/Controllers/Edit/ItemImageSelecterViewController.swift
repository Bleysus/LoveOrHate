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
        CustomData(name: "square.and.arrow.up"),
        CustomData(name: "square.and.arrow.down"),
        CustomData(name: "pencil"),
        CustomData(name: "pencil.slash"),
        CustomData(name: "square.and.pencil"),
        CustomData(name: "pencil.and.outline"),
        CustomData(name: "trash"),
        CustomData(name: "trash.slash"),
        CustomData(name: "folder"),
        CustomData(name: "paperplane"),
        CustomData(name: "tray"),
        CustomData(name: "doc.text"),
        CustomData(name: "calendar"),
        CustomData(name: "arrowshape.turn.up.left"),
        CustomData(name: "arrowshape.turn.up.right"),
        CustomData(name: "book"),
        CustomData(name: "bookmark"),
        CustomData(name: "rosette"),
        CustomData(name: "paperclip"),
        CustomData(name: "link"),
        CustomData(name: "pencil.tip"),
        CustomData(name: "person"),
        CustomData(name: "person.2"),
        CustomData(name: "person.3"),
        CustomData(name: "power"),
        CustomData(name: "globe"),
        CustomData(name: "sun.max"),
        CustomData(name: "sun.dust"),
        CustomData(name: "sun.haze"),
        CustomData(name: "moon"),
        CustomData(name: "zzz"),
        CustomData(name: "moon.zzz"),
        CustomData(name: "sparkles"),
        CustomData(name: "moon.stars"),
        CustomData(name: "cloud"),
        CustomData(name: "cloud.drizzle"),
        CustomData(name: "cloud.fog"),
        CustomData(name: "cloud.snow"),
        CustomData(name: "cloud.bolt"),
        CustomData(name: "cloud.sun"),
        CustomData(name: "smoke"),
        CustomData(name: "wind"),
        CustomData(name: "snow"),
        CustomData(name: "tornado"),
        CustomData(name: "tropicalstorm"),
        CustomData(name: "thermometer"),
        CustomData(name: "umbrella"),
        CustomData(name: "flame"),
        CustomData(name: "light.min"),
        CustomData(name: "rays"),
        CustomData(name: "timelapse"),
        CustomData(name: "keyboard"),
        CustomData(name: "rectangle.3.offgrid"),
        CustomData(name: "square.grid.2x2"),
        CustomData(name: "circle.grid.hex"),
        CustomData(name: "checkmark.seal"),
        CustomData(name: "xmark.seal"),
        CustomData(name: "exclamationmark.triangle"),
        CustomData(name: "play"),
        CustomData(name: "pause"),
        CustomData(name: "stop"),
        CustomData(name: "speaker"),
        CustomData(name: "speaker.slash"),
        CustomData(name: "music.note"),
        CustomData(name: "music.mic"),
        CustomData(name: "mic"),
        CustomData(name: "heart.slash"),
        CustomData(name: "heart"),
        CustomData(name: "suit.club"),
        CustomData(name: "suit.spade"),
        CustomData(name: "suit.diamond"),
        CustomData(name: "star"),
        CustomData(name: "star.slash"),
        CustomData(name: "flag"),
        CustomData(name: "location"),
        CustomData(name: "bell"),
        CustomData(name: "tag"),
        CustomData(name: "bolt"),
        CustomData(name: "eye"),
        CustomData(name: "ant"),
        CustomData(name: "camera"),
        CustomData(name: "bubble.left"),
        CustomData(name: "phone"),
        CustomData(name: "envelope"),
        CustomData(name: "gear"),
        CustomData(name: "cart"),
        CustomData(name: "creditcard"),
        CustomData(name: "hifispeaker"),
        CustomData(name: "tuningfork"),
        CustomData(name: "paintbrush"),
        CustomData(name: "wrench"),
        CustomData(name: "hammer"),
        CustomData(name: "eyedropper"),
        CustomData(name: "printer"),
        CustomData(name: "house"),
        CustomData(name: "wifi"),
        CustomData(name: "pin"),
        CustomData(name: "mappin"),
        CustomData(name: "map"),
        CustomData(name: "tv"),
        CustomData(name: "car"),
        CustomData(name: "guitars"),
        CustomData(name: "bed.double"),
        CustomData(name: "hare"),
        CustomData(name: "tortoise"),
        CustomData(name: "film"),
        CustomData(name: "sportscourt"),
        CustomData(name: "smiley"),
        CustomData(name: "barcode"),
        CustomData(name: "photo"),
        CustomData(name: "shield"),
        CustomData(name: "gamecontroller"),
        CustomData(name: "ear"),
        CustomData(name: "hand.raised"),
        CustomData(name: "timer"),
        CustomData(name: "hand.thumbsup"),
        CustomData(name: "hand.thumbsdown"),
        CustomData(name: "waveform.path.ecg"),
        CustomData(name: "headphones"),
        CustomData(name: "gift"),
        CustomData(name: "airplane"),
        CustomData(name: "hourglass"),
        CustomData(name: "burn"),
        CustomData(name: "eyeglasses"),
        CustomData(name: "battery.25"),
        CustomData(name: "lightbulb"),
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
