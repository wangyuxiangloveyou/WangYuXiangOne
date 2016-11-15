//
//  CollectView.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/10.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class CollectView: UIView {
    
    var colletionView:UICollectionView!
    var jumpClosure:IngreJumpClosure?
    var collectModel11:CollectModel?{
        didSet{
            colletionView?.reloadData()
            }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadData4()
        configUI4()
    }
    
    func loadData4() {
        Alamofire.request(.GET, collectUrl, parameters: nil, encoding: ParameterEncoding.URL, headers:nil).responseData { (reaponse) in
            let data = reaponse.data
            let model = CollectModel.parseData(data!)
            self.collectModel11 = model
        }
    }
    
    func configUI4(){
        let flowLayout=UICollectionViewFlowLayout()
        /*设置滚动方向
         Vertical 竖直滚动
         Horizontal 水平滚动
         */
        flowLayout.scrollDirection = .Vertical
        //设置平行滑动方向的cell之间最小间隔
        flowLayout.minimumInteritemSpacing=10
        //设置垂直滑动方向的cell之间的最小间隔
        flowLayout.minimumLineSpacing=10
        colletionView=UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight-64), collectionViewLayout: flowLayout)
        //delegate放逻辑和布局相关的方法
        colletionView.delegate=self
        //dataSource放和数据相关的方法
        colletionView.dataSource=self
        /*提前注册xib定制的cell
         */
        colletionView.registerNib(UINib(nibName: "FourCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FourCollectionViewCellId")
        colletionView.registerClass(CollectHeaderView1.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        colletionView.backgroundColor=UIColor.whiteColor()
        addSubview(colletionView)
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectView:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if collectModel11?.index_page_modules?.count != nil{
            return (collectModel11?.index_page_modules?.count)!
        }
        return 0
    }
    
    /*设置第section组有多少个cell
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectModel11?.index_page_modules![section].cards_inf!?.count != nil{
            return (collectModel11?.index_page_modules![section].cards_inf!?.count)!
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.section == 3 || indexPath.section == 6 {
            return CGSize(width:screenWidth/3-16, height: (screenWidth/3-20)*1.7)
        }else {
            return CGSize(width: screenWidth/2-16, height: (screenWidth/2-20)*0.75)
            }
    }
    
    /*返回第section组，所有cell组合到一起后，上下左右的距离
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    /*返回cell
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell=colletionView.dequeueReusableCellWithReuseIdentifier("FourCollectionViewCellId", forIndexPath: indexPath) as! FourCollectionViewCell
        cell.titleLabel.text = self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].title
        cell.updataLabel.text=self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].sub_title
        cell.subLabel.text=self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].image_b_r_title
        if self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].image_200_300 != nil && indexPath.section == 3 || indexPath.section == 6 && self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].image_200_300 != nil{
            let url=NSURL(string: (self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].image_200_300!)!)
            cell.imageName.kf_setImageWithURL(url, placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            }else if self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].image_448_252 != nil{
            let url1=NSURL(string: (self.collectModel11?.index_page_modules![indexPath.section].cards_inf?![indexPath.row].image_448_252!)!)
            cell.imageName.kf_setImageWithURL(url1, placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if ((collectModel11!.index_page_modules![indexPath.section].cards_inf!![indexPath.row].skip_inf?.video_id) != nil){
            urlstring = "http://www.tudou.com/programs/view/" + (collectModel11!.index_page_modules![indexPath.section].cards_inf!![indexPath.row].skip_inf?.video_id)!
            
        }else if (collectModel11!.index_page_modules![indexPath.section].cards_inf!![indexPath.row].skip_inf?.skip_url) != nil{
            urlstring=collectModel11!.index_page_modules![indexPath.section].cards_inf!![indexPath.row].skip_inf?.skip_url
        }
        if jumpClosure != nil{
            jumpClosure!(urlstring!)
            }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 320, height: 50)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader{
            let header=colletionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! CollectHeaderView1
            header.backgroundColor=UIColor.blackColor()
            header.allModel1=collectModel11?.index_page_modules![indexPath.section]
            return header
        }
        return UICollectionReusableView()
    }
}
