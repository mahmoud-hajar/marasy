//
//  ViewController.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/24/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD
import SwiftyJSON



class LoginVC: UIViewController {

    
    
    @IBOutlet weak var phoneTF: UITextField!
     @IBOutlet weak var passTF: UITextField!
      @IBOutlet weak var sginIn: UIButton!
       @IBOutlet weak var skip: UIButton!
        @IBOutlet weak var sginUp: UIButton!
         @IBOutlet weak var phView: SpringView!
          @IBOutlet weak var pasView: SpringView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.setLoca()
        self.setDes()

    }


    
    
    @IBAction func sginInBu(_ sender: UIButton) {
        Helper.hudStart()
         sender.springAnimate()
        guard let num = phoneTF.text, !num.isEmpty,
              let pass = passTF.text, !pass.isEmpty else {
            SVProgressHUD.dismiss()
                Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "fill"), vc: self)
                return
        }
    
        API.login(mobile: num, password:pass) { (error:Error?, success:Bool?) in
            if success == true {
               SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.dismiss()
            }
        }
        
        
        
    }
    
    
    @IBAction func skipBu(_ sender: Any) {
        
        let Sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =   Sb.instantiateViewController(withIdentifier: "main")
        self.present(vc, animated: true,completion: nil)
        
    }
    
    
    @IBAction func sginUpBu(_ sender: Any) {
        
        performSegue(withIdentifier: "SginUpSegue", sender: self)
    }
    
    
    fileprivate func setLoca() {
        
        self.phoneTF.placeholder = General.stringForKey(key: "phone")
         self.passTF.placeholder = General.stringForKey(key: "password")
          self.sginIn.setTitle(General.stringForKey(key: "sginIn"), for: .normal)
           self.skip.setTitle(General.stringForKey(key: "skip"), for: .normal)
            self.sginUp.setTitle(General.stringForKey(key: "sginUp"), for: .normal)
    }
    
    
    
    fileprivate func setDes() {
        
    Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "Bitmap")!, vc: self)
        self.hideNavigationShadow(viwController: self)

        self.phView.setRoundCorners(radius: 12.0)
         self.pasView.setRoundCorners(radius: 12.0)
        
        self.phoneTF.placeHolderClor = UIColor.white
         self.passTF.placeHolderClor = UIColor.white
        
        self.sginIn.setRaudis(raduis: 12.0)
        
        
    }
    
    
    
    fileprivate func convertTJson(str:String)-> Any? {
        let parmJSON = JSON(str)
        return  parmJSON.rawString(String.Encoding.utf8)
    }
   
    
    fileprivate func convertoJSON(par:Any)-> Data {
        return try! JSONSerialization.data(withJSONObject: par, options:[])

    }
    

    
    
    
    
}

