//
//  ProductsVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD


// set recId 
class ProductsVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var currentPage:Int = 1
    var proData = [Product]()

    
    var recId:Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Helper.hudStart()
        
        if API.isConnectedToInternet() {
            DispatchQueue.main.async {
                self.getProduct(id: 2, page: self.currentPage)
            }
        } else {
            SVProgressHUD.dismiss()
            Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "chkInter"), vc: self)
        }
        confirmTableView()
        
        
 Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)
        
        
    }
    
    
    
    
    fileprivate func confirmTableView () {
        tableView.dataSource = self
         tableView.delegate = self
          tableView.tableFooterView = UIView()
           tableView.tableFooterView?.backgroundColor = UIColor.clear
        
    }

    
    
    fileprivate func getProduct(id:Int,page:Int) {
        
        API.getProducts(id: id, pageNO: page) { (error:Error?, data:[Product]?) in
            if data != nil {
              self.proData.append(contentsOf: data!)
                 self.tableView.reloadData()
                print(data!)
                SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    
    
    
    
    
    
}
extension ProductsVC: UITableViewDelegate , UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.priceLabel.text = "\(proData[indexPath.row].price)"
         cell.pics = proData[indexPath.item]
          cell.rsLabel.text = General.stringForKey(key: "rs")
           cell.nameLabel.text = proData[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == proData.count - 1 {
            if currentPage < proData[indexPath.row].totalPages {
                self.currentPage += 1
                print(currentPage)
                getProduct(id: recId, page: currentPage)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        performSegue(withIdentifier: "contentSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contentSegue" {
            let con = segue.destination as? ContentVC
            
            
        }
    }
    
    
    
}
