//
//  OffersVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/27/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD




class OffersVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
     var currentPage:Int = 1
      var totalPages:Int = 1
    
       var offerData = [MainPro]()
    
    
    var selectedId:Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpTableView()
        
        self.hideNavigationShadow(viwController: self)
        Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)

        if API.isConnectedToInternet() {
            DispatchQueue.main.async {
                self.getOffers(pageNu: self.currentPage)
            }
        } else {
            SVProgressHUD.dismiss()
            Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "chkInter"), vc: self)
              }


        

    }
    
    
    
    
    fileprivate func setUpTableView() {
        
        self.tableView.dataSource = self
         self.tableView.delegate = self
          self.tableView.tableFooterView = UIView()
           self.tableView.tableFooterView?.backgroundColor = UIColor.clear
        
        
    }
    
    fileprivate func getOffers(pageNu:Int) {
        
        API.getOffers(pageNO: pageNu) { (error:Error?, data:[MainPro]?) in
            if data != nil {
                self.offerData.append(contentsOf: data!)
                 self.tableView.reloadData()
                  print(data!)
            } else {
                print("offers data is nil")
            }
        }
    }
    
    
    
    
    
    
}
extension OffersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "offerCell", for: indexPath) as! OfferCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.pics = offerData[indexPath.item]
         cell.titleLabel.text = offerData[indexPath.row].name
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       // selectedId = offerData[indexPath.row].id
        
        performSegue(withIdentifier: "roSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "roSegue" {
            let pro = segue.destination as? ProductsVC
              pro?.recId = selectedId
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
