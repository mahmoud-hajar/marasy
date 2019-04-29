//
//  SginUpVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD


class SginUpVC: UIViewController {

    
    
    @IBOutlet weak var nameView: SpringView!
    @IBOutlet weak var phoneView: SpringView!
    @IBOutlet weak var passwordView: SpringView!
    
    
    @IBOutlet weak var nameTF: ImageInsideTextField!
    @IBOutlet weak var phoneTF: ImageInsideTextField!
    @IBOutlet weak var passwordTF: ImageInsideTextField!
    
    
    @IBOutlet weak var sginUp: SpringButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


         loca()
          des()

    }
    

    
    
    @IBAction func sginUpBtn(_ sender: UIButton) {
        Helper.hudStart()
        sender.springAnimate()
        guard let nam = nameTF.text, !nam.isEmpty,
               let pho = phoneTF.text, !pho.isEmpty,
                let pass = passwordTF.text, !pass.isEmpty  else {
                    
                SVProgressHUD.dismiss()
                Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "fill"), vc: self)
                return
                
        }
        
        API.register(name: nam, mobile: pho, password: pass) { (error:Error?, success:Bool?) in
            
            if success == true {
                SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.dismiss()
            }
        }
        
        
        
    }
    
    
    
    
    
    fileprivate func loca() {
        
        
        self.nameTF.placeholder = General.stringForKey(key: "name")
         self.phoneTF.placeholder = General.stringForKey(key: "phone")
          self.passwordTF.placeholder = General.stringForKey(key: "password")
        
        self.sginUp.setTitle(General.stringForKey(key: "sginUp"), for: .normal)
        
        
    }
    
    
    fileprivate func des() {
        
    Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "Bitmap")!, vc: self)
      
        nameView.setRoundCorners(radius: 12.0)
         phoneView.setRoundCorners(radius: 12.0)
          passwordView.setRoundCorners(radius: 12.0)
        
        nameTF.placeHolderClor = UIColor.white
         phoneTF.placeHolderClor = UIColor.white
          passwordTF.placeHolderClor = UIColor.white        
    
        sginUp.setRaudis(raduis: 12.0)
        
    }
    
    
    
   
}
