//
//  UIImage + extension.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/24/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    func setImgCornerRaduis(_ radu: CGFloat) {
        self.layer.cornerRadius = radu
         self.clipsToBounds = true
    }
    
  
    
   
    
    
}

