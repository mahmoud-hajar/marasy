//
//  TextView + extesnions.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/28/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit


extension UITextView  {
    
    
    func setRoundCorners(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    
    
    
}
