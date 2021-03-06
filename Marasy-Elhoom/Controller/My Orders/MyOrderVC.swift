//
//  MyOrderVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/26/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD

class MyOrderVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var HeightConstant: NSLayoutConstraint!
    
    
    
    var selectedArray = [MyOrder]()
    
    
    
    var selectedIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    var indicatorView = UIView()
    let indicatorHeight : CGFloat = 3
    
    var currentPage = 1
    var totalPages = 1
    
    
    
    var menuTitles:[String] = [ General.stringForKey(key: ""),
                                 General.stringForKey(key: ""),   General.stringForKey(key: "")
                              ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        Helper.hudStart()
           setDesi()
        setProtocls()
        
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredVertically)
        
        if API.isConnectedToInternet() {
            
            if Helper.checkUserId() == true {
                self.collectionView.isUserInteractionEnabled = true
                DispatchQueue.main.async {
                    
                    
                    
                }
                createSwipGestures()
            } else {
                SVProgressHUD.dismiss()
                self.HeightConstant.constant = 0
                collectionView.layoutIfNeeded()
               Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key:"notAv"), vc: self)
            }
            
            
        } else {
            SVProgressHUD.dismiss()
            Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "chkInter"), vc: self)
            print("device not connected to internet")
        }
        
        
        

    }
    
    
    
    fileprivate func setProtocls() {
        
       self.collectionView.delegate = self
         self.collectionView.dataSource = self
          self.tableView.dataSource = self
           self.tableView.delegate = self
            self.tableView.tableFooterView = UIView()
            self.tableView.tableFooterView?.tintColor = UIColor.clear
    }

    
    fileprivate func refreshContent() {
        
        if selectedIndex == 0 {

        } else if selectedIndex == 1 {

            
        } else {

            
        }
        let x = (collectionView.bounds.width / 3.0) * CGFloat(selectedIndex)
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame = CGRect(x: x, y: self.collectionView.bounds.maxY - self.indicatorHeight, width: self.collectionView.bounds.width / 3.0, height: self.indicatorHeight)
        }
        
    }
    
    func createSwipGestures() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipAction))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipAction))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func swipAction(sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            if selectedIndex < 3 - 1 {
                selectedIndex += 1
            }
        } else {
            if selectedIndex > 0 {
                selectedIndex -= 1
            }
        }
        selectedIndexPath = IndexPath(item: selectedIndex, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
        refreshContent()
    }
    
    
    fileprivate func setDesi() {
        
        self.hideNavigationShadow(viwController: self)
        Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)
        
    }
    
    
    
}
extension MyOrderVC:  UITableViewDataSource , UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        
        
        
        
        return cell
    }
    


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 132.0
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
    
    
    
    
}
extension MyOrderVC: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        
        
        
        if indexPath.row == 0 {
            cell.setupCell(text: General.stringForKey(key: "Finished"))
        } else if indexPath.row == 1 {
            cell.setupCell(text: General.stringForKey(key: "Current"))
        } else if indexPath.row == 2 {
            cell.setupCell(text: General.stringForKey(key: "New"))
        }
        
      
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 3 , height: collectionView.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.item
        refreshContent()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    
    
    
}

