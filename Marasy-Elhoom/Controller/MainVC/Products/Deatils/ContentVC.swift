//
//  ContentVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/28/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD



class ContentVC: UIViewController {

    
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var quaView: UIView!
    
    
    @IBOutlet weak var quaLab: UILabel!
    @IBOutlet weak var sizeLab: UILabel!
    
 
    
    
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



    }
    

    
    @IBAction func plusBtn(_ sender: Any) {
        
        
        
    }
    
    @IBAction func minBtn(_ sender: Any) {
        
        
        
    }
    
    
    
    
    
    
    
    
    fileprivate func setDes() {
        
        self.imgView.floatView()
        self.contentView.setRoundCorners(radius: 12.0)
        
       self.img.setRoundCorners(radius: img.frame.size.width/2.0)
        self.imgView.setRoundCorners(radius: imgView.frame.size.width/2.0)
        
        
    }

    
    
}
