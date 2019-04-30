//
//  UITabBar.swift
//  Zi Elengaz
//
//  Created by mahmoudhajar on 3/22/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit


class TabBarController: UITabBarController {
    
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
        self.tabBar.items![0].title = General.stringForKey(key: "home")
        self.tabBar.items![1].title = General.stringForKey(key: "myOrder")
        self.tabBar.items![2].title = General.stringForKey(key: "offers")
        self.tabBar.items![3].title = General.stringForKey(key: "profile")
        self.tabBar.items![4].title = General.stringForKey(key: "more")
        
        
        
    }
    
    
   

    
    
}
