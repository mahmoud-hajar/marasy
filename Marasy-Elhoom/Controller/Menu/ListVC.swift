//
//  ListVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/27/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loca: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    configTableView()
        
        self.hideNavigationShadow(viwController: self)
        Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)
        
        
        
        
        
        
        
    }
    
    
    
    
    @IBAction func locaBtn(_ sender: Any) {
        
        if General.CurrentLanguage() == "ar"
        {
            CheckLanguage.ChangeLanguage(NewLang: "en")
        }else
        {
            CheckLanguage.ChangeLanguage(NewLang: "ar")
        }
        Helper.restartApp()
    }
    
    
    
    fileprivate func configTableView() {
    
       tableView.dataSource = self
        tableView.delegate = self
         tableView.tableFooterView = UIView()
          tableView.tableFooterView?.backgroundColor = UIColor.clear
    
    }
    
    
    
}
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        if indexPath.row == 0 {
            cell.titleLab.text = General.stringForKey(key: "")

        } else if indexPath.row == 1 {
            cell.titleLab.text = General.stringForKey(key: "")

        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            cell.titleLab.text = General.stringForKey(key: "contact")
            cell.img.image = UIImage(named: "contact.png")
        } else if indexPath.row == 4 {
            cell.titleLab.text = General.stringForKey(key: "logout")
              cell.img.image = UIImage(named: "logout.png")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if Helper.checkUserId() == false {
            if indexPath.row == 4 {
                return 0
            }
        } else {
            if indexPath.row == 0 {
                return 0
            }
        }
        
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "sginInSegue", sender: self)
        } else if indexPath.row == 1 {
            
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            performSegue(withIdentifier: "contactSegue", sender: self)
        } else if indexPath.row == 4  {
            Helper.deletUserDefaults()
        }
            
        
    }
    
    
    
}
