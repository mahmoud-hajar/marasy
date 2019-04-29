//
//  MainCell.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import Kingfisher



class MainCell: UICollectionViewCell {
    
    
    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var proName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        proImg.setImgCornerRaduis(proImg.frame.size.width/2)
        
    }
    
    var pics: MainPro? {
        didSet {
            guard let imgs = pics else { return }
            self.proImg.kf.indicatorType = .activity
            if let url = URL(string: (imgs.image) ) {
                self.proImg.kf.setImage(with: url, options:[.transition(ImageTransition.fade(0.5))])
                
            }
        }
    }
    
    
    
}
