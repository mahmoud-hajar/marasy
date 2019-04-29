//
//  Product.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SwiftyJSON



class Product: NSObject {

    
    var id:Int = 0
     var name:String = ""
      var image:String = ""
       var price:Double = 0.0
         var totalPages:Int = 1
    
    init?(dic:[String:JSON]) {
        
        
        let inr = dic["innerData"]!
       // self.totalPages = (dic["total"]?.int)!
        
        let dat =  inr["data"].array
        for ddd in dat! {
            
            self.id = ddd["id"].int!
             self.name = ddd["name"].string!
              self.image = ddd["image"].string!
               self.price = ddd["price"].double!
            
        }
    }
    
    
    
}
