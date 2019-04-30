//
//  RulesVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/27/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SVProgressHUD




class RulesVC: UIViewController {

    
    @IBOutlet weak var txtView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideNavigationShadow(viwController: self)
        Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)


    }
    
    
    

    

}
