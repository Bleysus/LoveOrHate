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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemImage.image = UIImage(systemName: K.currentImage)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
