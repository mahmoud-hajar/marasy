//
//  ProductCell.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import Kingfisher





class ProductCell: UITableViewCell {

    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var proImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
       self.bgView.floatView()
        
        
    }

   
    
    var pics: Product? {
        didSet {
            guard let imgs = pics else { return }
            self.proImage.kf.indicatorType = .activity
            if let url = URL(string: (imgs.image) ) {
                self.proImage.kf.setImage(with: url, options:[.transition(ImageTransition.fade(0.5))])

            }
        }
    }
    
    
    
}
