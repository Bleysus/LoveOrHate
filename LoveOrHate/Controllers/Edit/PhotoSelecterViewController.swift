//
//  PhotoSelecterViewController.swift
//  LoveOrHate
//
//  Created by Bleysus on 01.12.2019.
//  Copyright © 2019 Bleysus.com. All rights reserved.
//

import UIKit

protocol PhotoSelecterViewControllerDelegate {
    func fetchImage(image: String)
}

class PhotoSelecterViewController: UICollectionViewController {

    var delegate: PhotoSelecterViewControllerDelegate?
    
    
    @IBOutlet weak var cellImage: UIImageView!
    
    var currentImage = ""
    
    let photosArray = ["paperplane","archivebox","doc","calendar","person","clear","globe","sun.max","moon","cloud","cloud.bolt","wind","snow","tornado","hurricane","keyboard","play","stop","speaker","music.note","music.mic","heart","location"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.photoSelecterCellIdentifier, for: indexPath) as! PhotoSelecterCollectionViewCell
        
        cell.photoImage.image = UIImage(systemName: photosArray[indexPath.row])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.fetchImage(image: photosArray[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension UICollectionView {
    @IBInspectable var backgroundImage: UIImage? {
        get {
            return nil
        }
        set {
            backgroundView = UIImageView(image: newValue)
            backgroundView?.alpha = 0.35
        }
    }
}
