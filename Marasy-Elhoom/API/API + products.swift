//
//  API + products.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    
//    class func slider(completion:@escaping(_ error:Error?, _ data:[Slider]?)->Void){
//
//        let url = URLs.slider
//
//        print(url)
//        Alamofire.request(url, method: .get).responseJSON { (response) in
//
//            switch response.result {
//            case.failure(let error):
//                completion(error,nil)
//                print(error)
//            case.success(let value):
//                let jsonData = JSON(value)
//                print("slider data",jsonData)
//
//                guard let dataArray = jsonData["data"].array else{
//                    completion(nil , nil)
//                    return
//                }
//                var slide = [Slider]()
//                for dta in dataArray {
//                    if let data = dta.dictionary , let res = Slider.init(dic: data) {
//                        slide.append(res)
//                        print("good")
//                    }
//                }
//                completion(nil, slide)
//            }
//        }
//    }
//
    
    class func mainCategory(pageNO:Int,completion:@escaping(_ error:Error?, _ data:[MainPro]?)->Void){
        
        let url = URLs.category+"?page=\(pageNO)"
        
        print(url)
        Alamofire.request(url, method: .get).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode {
                
            case 500?:
                print("category server proble")
            case 404?:
                print("category page not found")
            case 200?:
                switch response.result {
                case.failure(let error):
                    completion(error,nil)
                    print(error)
                case.success(let value):
                    let jsonData = JSON(value)
                    print("category data",jsonData)
                    
                    let inr = jsonData["innerData"]

                    guard let da = inr["data"].array else {
                        completion(nil, nil)
                        return
                    }
                    var cate = [MainPro]()
                     for dta in da {
                    if let data = dta.dictionary , let res = MainPro.init(dic: data) {
                        cate.append(res)
                        print("good")
                    }
                    }
                    completion(nil, cate)
                }
            default:break
            }
        }
    }
    
    class func getProducts(id:Int,pageNO:Int,completion:@escaping(_ error:Error?, _ data:[Product]?)->Void){
        
        let url = URLs.prodct+"\(id)"+"?page=\(pageNO)"
        
        print(url)
        Alamofire.request(url, method: .get).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode {
                
            case 500?:
                print("category server proble")
            case 404?:
                print("category page not found")
            case 200?:
                switch response.result {
                case.failure(let error):
                    completion(error,nil)
                    print(error)
                case.success(let value):
                    let jsonData = JSON(value)
                    let inr = jsonData["innerData"]
                    guard let da = inr["data"].array else {
                        completion(nil, nil)
                        return
                    }
                    print("category data",jsonData)
                    
                    var cate = [Product]()
                     for dta in da {
                    if let data = dta.dictionary , let res = Product.init(dic: data) {
                        cate.append(res)
                        print("good")
                    }
                    }
                    completion(nil, cate)
                }
            default:break
            }
        }
    }
    
    
    
    
    class func getOffers(pageNO:Int,completion:@escaping(_ error:Error?, _ data:[MainPro]?)->Void){
        
        let url = URLs.offer+"\(pageNO)"
        
        print(url)
        Alamofire.request(url, method: .get).validate(statusCode: 200..<300).responseJSON { (response) in
            
            switch response.response?.statusCode {
                
            case 500?:
                print("category server problem")
            case 404?:
                print("category page not found")
            case 200?:
                switch response.result {
                case.failure(let error):
                    completion(error,nil)
                    print(error)
                case.success(let value):
                    let jsonData = JSON(value)
                  //  print("category data",jsonData)
                    
                    //                guard let dataArray = jsonData.array else{
                    //                    completion(nil , nil)
                    //                    return
                    //                }
                    var cate = [MainPro]()
                    // for dta in dataArray {
                    if let data = jsonData.dictionary , let res = MainPro.init(dic: data) {
                        cate.append(res)
                        print("good")
                    }
                    //}
                    completion(nil, cate)
                }
            default:break
            }
        }
    }
    
    
    
    
    
    
    
    
}
