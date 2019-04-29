//
//  Helper.swift
//  Iris
//
//  Created by mahmoudhajar on 2/3/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD

class Helper: NSObject {

    class func restartApp() {
        
        guard let window = UIApplication.shared.keyWindow else {return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        if checkUserId() == false {
            vc = sb.instantiateInitialViewController()!
        } else {
            vc = sb.instantiateViewController(withIdentifier: "main")
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
    }
    
    class func saveUserId(user_id: Int) {
      let def = UserDefaults.standard
        def.setValue(user_id, forKey: "user_id")
          def.synchronize()
        restartApp()
    }
    
    class func checkUserId()->Bool {
        let def = UserDefaults.standard
        return (def.object(forKey: "user_id") as? Int) != nil
        
    }
    
    class func getUserId() -> Int {
        let def = UserDefaults.standard
        return (def.object(forKey: "user_id") as! Int)
    }
    
    class func setUserData(name:String,phone:String,password:String){
        
        let def = UserDefaults.standard
        def.setValue(name, forKey: "name")
        def.setValue(phone, forKey: "phone")
        def.setValue(password, forKey: "password")
        def.synchronize()
        restartApp()
    }
    
    class func deletUserDefaults() {
        
        let def = UserDefaults.standard
        def.removeObject(forKey: "name")
        def.removeObject(forKey: "password")
        def.removeObject(forKey: "user_id")
        def.removeObject(forKey: "phone")
        UserDefaults.standard.synchronize()
        
        restartApp()
        
    }
    
    
   class func hudStart() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.none)
        SVProgressHUD.setForegroundColor(UIColor.white)           //Ring Color
        SVProgressHUD.setBackgroundColor(UIColor.darkGray)        //HUD Color
        SVProgressHUD.setRingThickness(6.0)
        //SVProgressHUD.setBackgroundLayerColor(UIColor.green)    //Background Color
        SVProgressHUD.show()
    }

    
    class func showSuccess(title:String){
        
        SVProgressHUD.show(UIImage(named: "cor.png")!, status: title)
        SVProgressHUD.setShouldTintImages(false)
        SVProgressHUD.setImageViewSize(CGSize(width: 40, height: 40))
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 20.0))
        SVProgressHUD.dismiss(withDelay: 2.5)
        
    }
    
    class func showError(title:String) {
        
        SVProgressHUD.show(UIImage(named: "er.png")!, status: title)
        SVProgressHUD.setShouldTintImages(false)
        SVProgressHUD.setImageViewSize(CGSize(width: 40, height: 40))
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 20.0))
        SVProgressHUD.dismiss(withDelay: 2.5)
    }
 
    
    //MARK:- SET states bar backgroundColor
    class func statusBar(colr: UIColor ) {
        
        guard let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {return}
        statusBarView.backgroundColor = colr

    }
    
    //Mark:- background Image for navigation
    class func setBackgroundIamgeForNavigation(img:UIImage, vc:UIViewController) {
  vc.navigationController?.navigationBar.setBackgroundImage(img.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)

    }
    
    //Mark:- convert to JSON
    class func toJSON(object:Any)->String {
     if let json = try? JSONSerialization.data(withJSONObject: object, options: []) {
            return  String(data: json, encoding: String.Encoding.utf8)!
            }
            return ""
    }
    
    
    
    
}
