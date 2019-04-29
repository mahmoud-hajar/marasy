//
//  MainVC.swift
//  Marasy-Elhoom
//
//  Created by mahmoudhajar on 4/25/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit
import SVProgressHUD
import ImageSlideshow



class MainVC: UIViewController {

    
    @IBOutlet weak var sliderShow: ImageSlideshow!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var imgSource = [InputSource]()
    var categ = [MainPro]()
    
    var currentPage = 1
     var totalPages = 1
    
    
    var selectedId:Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.confirmPrortcol()
         Helper.setBackgroundIamgeForNavigation(img: UIImage(named: "header")!, vc: self)

        if API.isConnectedToInternet() {
            DispatchQueue.main.async {
               self.getProd(pag: self.currentPage)
            }
        } else {
            SVProgressHUD.dismiss()
            Alert.alertPopUp(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "chkInter"), vc: self)
            print("device not connected to internet")
        }



    }
    

    fileprivate func confirmPrortcol() {
        
        collectionView.dataSource = self
         collectionView.delegate = self
        
        
        
        
    }
    
    
    fileprivate func confrimSlider() {
        
        
        
        sliderShow.slideshowInterval = 5.0
        sliderShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .bottom)
        sliderShow.contentScaleMode = UIView.ContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        sliderShow.pageIndicator = pageControl
        
        sliderShow.activityIndicator = DefaultActivityIndicator()
        sliderShow.activityIndicator = DefaultActivityIndicator(style: .gray , color: nil )
        
        sliderShow.currentPageChanged = { page in
            print("current page:", page)
        }
        
        sliderShow.addSubview(pageControl)
        
    }
    
    
    fileprivate func getSliderData() {
        
        
//        API.slider{ (error: Error?, data:[Slider]?) in
//            if data != nil {
//                for da in data! {
//                    self.imgSource.append(KingfisherSource(urlString: da.image)!)
//                }
//                self.slider.setImageInputs(self.imgSource)
//            } else {
//                print("Slider have no data")
//            }
//        }
//
    }
    
    
    
    fileprivate func getProd(pag:Int) {
        
        API.mainCategory(pageNO: pag) { (error:Error?, data:[MainPro]?) in
            if data !=  nil {
               self.categ.append(contentsOf: data!)
                 self.collectionView.reloadData()
                print(data!)
            } else {
                print("product is null")
            }
        }
    }
    
    
    
    
    
    
    
    

}
extension MainVC: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categ.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCell
        
        cell.proName.text = categ[indexPath.row].name
         cell.pics = categ[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == categ.count - 1 {
            if currentPage < categ[indexPath.row].totalPages {
                
                self.currentPage += 1
                 print("paginaton number",currentPage)
                getProd(pag: currentPage)
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        self.selectedId = categ[indexPath.row].id
         print(categ[indexPath.row].id)
        performSegue(withIdentifier: "ProSegue", sender: self)
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ProSegue" {
             let pro = segue.destination as? ProductsVC
               pro?.recId = selectedId
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let yourWidth = collectionView.bounds.width/2.0
            let yourHeight = yourWidth
            
            return CGSize(width: yourWidth, height: yourHeight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets.zero
        
        
    }
    
    
    
    
    
}
