//
//  ProfileVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/26/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD



class ProfileVC: UIViewController {

    
    
    
    @IBOutlet weak var userNameLab: UILabel!
    @IBOutlet weak var phoneLab: UILabel!
    @IBOutlet weak var passwordLab: UILabel!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var send: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if Helper.checkUserId() == true {
            setUserData()
            self.send.isUserInteractionEnabled = true
        } else {
            self.send.isUserInteractionEnabled = false
        }

        
        

    }
    

    @IBAction func sendBtn(_ sender: UIButton) {
        
        Helper.hudStart()
        sender.springAnimate()
        
        guard let nam = userNameTF.text, !nam.isEmpty,
              let pho = phoneTF.text, !pho.isEmpty,
              let pass = passwordTF.text, !pass.isEmpty else {
             
                SVProgressHUD.dismiss()
                Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "fill"), vc: self)
                return
        }
        
        API.updateProfile(user_id: Helper.getUserId(), name: nam, mobile: pho, password: pass) { (error:Error?, success:Bool?) in
            if success == true {
                SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.dismiss()
            }
        }
        
        
    }
    
    
    
    
    fileprivate func setUserData() {
        
        self.passwordTF.text = (UserDefaults.standard.object(forKey: "password") as! String)
        self.userNameTF.text = (UserDefaults.standard.object(forKey: "name") as! String)
        self.phoneTF.text = (UserDefaults.standard.object(forKey: "phone") as! String)
        
        
         }
    
   
    
    fileprivate func setLoca() {
        
        userNameLab.text = General.stringForKey(key: "name")
         phoneLab.text = General.stringForKey(key: "phone")
          passwordLab.text = General.stringForKey(key: "password")
        
        send.setTitle(General.stringForKey(key: "update"), for: .normal)
        
    }
    
    
    fileprivate func setDes() {
        
    Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)
      send.setRaudis(raduis: 12.0)
    
    }
    
    

}
