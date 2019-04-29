//
//  MenuCell.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/26/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit


class MenuCell: UICollectionViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title.alpha = 0.6
        
    }
    
    func setupCell(text: String) {
        title.text = text
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.title.alpha = 1.0
                self.backgroundColor = #colorLiteral(red: 0.7882352941, green: 0.1450980392, blue: 0.1725490196, alpha: 1)
            } else {
                self.title.alpha = 0.6
                self.backgroundColor = UIColor.clear
                
            }
        }
    }
    
    
    
    
    
}
