//
//  API.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/24/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD



class API: NSObject {
    
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
    class func login(mobile: String,password:String ,completion: @escaping(_ error: Error?, _ success: Bool?)->Void) {
        
        let url = URLs.login
        
        let header = [
            
            "Accept": "application/json"
        ]
        
        let para =
            [
                "mobile":mobile,
                "password":password
             ]
        
        Alamofire.request(url, method: .post, parameters: para , encoding: URLEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode{
            case 403? :
                print("coode 403 password wrong")
                Helper.showError(title: General.stringForKey(key: "wro"))
            case 404? :
                print("coode 404 not found page")
                Helper.showError(title: General.stringForKey(key: "noFound"))
            case 500?:
                print("coode 500 error with server")
            case 200?:
                switch response.result {
                    case.failure(let error):
                      print(error)
                        completion(error,false)
                    case.success(let value):
                      print(value)
                   let data = JSON(value)
                      let msg = data["message"].string
                      Helper.showSuccess(title: msg!)
                      let inr = data["innerData"]
                      
                   let id = inr["id"].int
                    let name = inr["name"].string
                     let phone = inr["mobile"].string
                       print(id!)
                        print(name!)
                         print(phone!)

                    Helper.setUserData(name: name!, phone: phone!, password: password)
                    Helper.saveUserId(user_id: id!)
                     }
               default: break
               }
             }
            }


    class func register(name:String,mobile: String,password:String ,completion: @escaping(_ error: Error?, _ success: Bool?)->Void) {
        
        let url = URLs.register
        
        let header = [
            
            "Accept": "application/json"
        ]
        
        let para:[String:Any] =
            [
                
                "name":name,
                "mobile":mobile,
                "password":password
            ]
        
        Alamofire.request(url, method: .post, parameters: para , encoding: URLEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode{
            case 404? :
                print("coode 404 not found page")
            case 500?:
                print("coode 500 error with server")
            case 409?:
                print("cooode 409 user exist")
                Helper.showError(title: General.stringForKey(key: "found"))
            case 200?:
                switch response.result {
                case.failure(let error):
                    print(error)
                    completion(error,false)
                case.success(let value):
                    print(value)
                    let data = JSON(value)
                    let msg = data["message"].string
                    Helper.showSuccess(title: msg!)
                    let inr = data["innerData"]
                    
                    let id = inr["id"].int
                    let name = inr["name"].string
                    let phone = inr["mobile"].string
                    print(id!)
                    print(name!)
                      print(phone!)
                    Helper.setUserData(name: name!, phone: phone!, password: password)
                    Helper.saveUserId(user_id: id!)
                }
            default: break
            }
        }
    }
    
    

    class func updateProfile(user_id:Int,name:String,mobile: String,password:String ,completion: @escaping(_ error: Error?, _ success: Bool?)->Void) {
        
        let url = URLs.update
        
        let header = [
            
            "Accept": "application/json"
        ]
        
        let para:[String:Any] =
            [
                "user_id":user_id,
                "name":name,
                "mobile":mobile,
                "password":password
        ]
        
        Alamofire.request(url, method: .post, parameters: para , encoding: URLEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode{
            case 404? :
                print("coode 404 not found page")
            case 500?:
                print("coode 500 error with server")
            case 200?:
                switch response.result {
                case.failure(let error):
                    print(error)
                    completion(error,false)
                case.success(let value):
                    print(value)
                    let data = JSON(value)
                    let msg = data["message"].string
                    Helper.showSuccess(title: msg!)
                    let inr = data["innerData"]
                    
                    let id = inr["id"].int
                    let name = inr["name"].string
                    let phone = inr["mobile"].string
                    print(id!)
                    print(name!)
                    print(phone!)
                    Helper.setUserData(name: name!, phone: phone!, password: password)
                    Helper.saveUserId(user_id: id!)
                }
            default: break
            }
        }
    }
    
    class func logOut(user_id:Int,completion: @escaping(_ error: Error?, _ success: Bool?)->Void) {
        
        let url = URLs.logout
        
        let header = [
            
            "Accept": "application/json"
        ]
        
        let para:[String:Any] =
               [
                "user_id":user_id
               ]
        
        Alamofire.request(url, method: .post, parameters: para , encoding: URLEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode{
            case 404? :
                print("coode 404 not found page")
            case 500?:
                print("coode 500 error with server")
            case 200?:
                switch response.result {
                case.failure(let error):
                    print(error)
                    completion(error,false)
                case.success(let value):
                    print(value)
                    let data = JSON(value)
                    let msg = data["message"].string
                    Helper.showSuccess(title: msg!)
                    Helper.deletUserDefaults()
                    
                }
            default: break
            }
        }
    }
    
    /*
     
     let para = [
     "token":String,
     id:String,
     
     
     
     
     
     ]
     
     
     
     
     
     
     
     */
    
    
    
    
    
}
