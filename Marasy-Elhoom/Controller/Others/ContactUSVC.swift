//
//  ContactUSVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/27/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD

class ContactUSVC: UIViewController {

    
    
    @IBOutlet weak var userLabel: SpringLabel!
    @IBOutlet weak var emailLabel: SpringLabel!
    @IBOutlet weak var leaveLabel: SpringLabel!
    
    
    @IBOutlet weak var nameTF: SpringTextField!
    @IBOutlet weak var emailTF: SpringTextField!
    @IBOutlet weak var msgTV: SpringTextView!
    
    
    @IBOutlet weak var send: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        setDes()
        loca()
        
        
    }
    

    
    @IBAction func SENDbTN(_ sender: UIButton) {
        Helper.hudStart()
        sender.springAnimate()
        guard let nam = nameTF.text, !nam.isEmpty,
               let ema = emailTF.text, !ema.isEmpty,
                let msg = msgTV.text, !msg.isEmpty else {
                
                SVProgressHUD.dismiss()
                Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "fill"), vc: self)
                return
        }
        
        API.contactUS(name: nam, email: ema, message: msg) { (error:Error?, success:Bool?) in
            if success == true {
               SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    
    
    
    fileprivate func setDes() {
        
        self.hideNavigationShadow(viwController: self)
        Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)
        msgTV.setRoundCorners(15.0)
        send.setRaudis(raduis: 12.0)


    }
    
    
    
    fileprivate func loca() {
        
        self.userLabel.text = General.stringForKey(key: "name")
         self.emailLabel.text = General.stringForKey(key: "email")
          self.leaveLabel.text = General.stringForKey(key: "leave")
           self.send.setTitle(General.stringForKey(key: "send"), for: .normal)
        
    }
    
    
    
    
    
    
}
