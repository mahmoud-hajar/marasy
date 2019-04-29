//
//  API + Others.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/28/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SVProgressHUD



extension API     {
    
    class func contactUS(name:String,email: String,message:String ,completion: @escaping(_ error: Error?, _ success: Bool?)->Void) {
        
        let url = URLs.contact
        
        let header = [
            "Accept": "application/json"
                     ]
        
        let para:[String:Any] =
            [
                "name":name,
                "email":email,
                "message":message
            ]
        
        Alamofire.request(url, method: .post, parameters: para , encoding: URLEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode{
            case 404? :
                print("coode 404 not found page")
            case 500?:
                print("coode 500 error with server")
            case 409?:
                print("cooode 409 user exist")
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
                    
                }
            default: break
            }
        }
    }
    
    
    
    
}
