//
//  OfferCell.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/27/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import Kingfisher


class OfferCell: UITableViewCell {

    
    @IBOutlet weak var Viw: UIView!
    @IBOutlet weak var offerImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

       Viw.floatView()
        self.Viw.setRoundCorners(radius: 10.0)
        
        
    }

    var pics: MainPro? {
        didSet {
            guard let imgs = pics else { return }
            self.offerImg.kf.indicatorType = .activity
            if let url = URL(string: (imgs.image) ) {
                self.offerImg.kf.setImage(with: url, options:[.transition(ImageTransition.fade(0.5))])
                
            }
        }
    }
    

}
