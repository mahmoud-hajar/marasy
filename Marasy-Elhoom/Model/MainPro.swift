//
//  MainPro.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainPro: NSObject {

    
    var id:Int = 1
     var name:String = ""
      var image:String = ""
       var totalPages:Int = 1
    
    init?(dic:[String:JSON]) {
    
        
        let inr = dic["innerData"]!
       // self.totalPages = (dic["total"]?.int)!
        
         let dat =  inr["data"].array
        print((dat?.count)!)
          for ddd in dat! {
           
            self.id = ddd["id"].int!
            self.name = ddd["name"].string!
            self.image = ddd["image"].string!
            print(id)
           }
         }
    
    
    
    
}
