//
//  fourImageView.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/7.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
public var url:String?
class fourImageView: UIView {
    var colletionView:UICollectionView!
    //var dataArray:[[FourImageModel]]=[]
    var jumpClosure:IngreJumpClosure?
  var addClosure:((String)->())!
    var fourModel:FourImageModel?{
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
        Alamofire.request(.GET, fourUrl, parameters: nil, encoding: ParameterEncoding.URL, headers:nil).responseData { (reaponse) in
            let data = reaponse.data
            let model = FourImageModel.parseData(data!)
            self.fourModel = model
            
        }
    }
    //    func loadData5(){
    //        Alamofire.request(.GET,fourUrl).responseJSON(completionHandler: {[unowned self] (response) in
    //            if response.result.error==nil{
    //
    //                let dic=response.result.value as! [String:AnyObject]
    //                let appArray=dic ["data"] as! [[String:AnyObject]]
    //                for dic in appArray{
    //                    let model=[fourModel2]()
    //                   let ablumArray=
    //                    self.dataArray.append(model)
    //                    print(self.dataArray[2].weekday)
    //                }
    //                self.colletionView!.reloadData()
    //            }
    //            })
    //    }
    
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
        colletionView.registerClass(HeaderReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")

        colletionView.backgroundColor=UIColor.whiteColor()
        addSubview(colletionView)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension fourImageView:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if fourModel?.data?.count != nil {
            return (fourModel?.data?.count)!
        }
        //return (fourModel?.data?.count)!
        return 0
    }
    
    /*设置第section组有多少个cell
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.fourModel?.data![section].album!.count != nil {
            return (self.fourModel?.data![section].album!.count)!
        }
        
        return 0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: 124, height: 190)
        }else if indexPath.section == 1{
            return CGSize(width: 190, height: 180)
            
        }else if indexPath.section == 2{
            return CGSize(width: 90, height: 190)
        }
        
        return CGSize(width: 124, height: 190)
    }
    
    /*返回第section组，所有cell组合到一起后，上下左右的距离
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    /*返回cell
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell=colletionView.dequeueReusableCellWithReuseIdentifier("FourCollectionViewCellId", forIndexPath: indexPath) as! FourCollectionViewCell
        cell.titleLabel.text = self.fourModel?.data![indexPath.section].album?[indexPath.row].title
        //print("\(self.fourModel?.data![indexPath.section].album?[indexPath.row].title)")
        //print("\(fourModel?.data![indexPath.section].album?[indexPath.section].picurl_200_300)")
        cell.updataLabel.text=self.fourModel?.data![indexPath.section].album?[indexPath.row].update_episode
        cell.subLabel.text=self.fourModel?.data![indexPath.section].album?[indexPath.row].sub_cat
        if fourModel?.data![indexPath.section].album?[indexPath.row].picurl_200_300 != nil{
             cell.imageName.kf_setImageWithURL(NSURL(string: (fourModel?.data![indexPath.section].album?[indexPath.row].picurl_200_300)!), placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
//            cell.imageName.kf_setImageWithURL(NSURL(string:(fourModel?.data![indexPath.section].album?[indexPath.row].picurl_200_300)!))
            
        }
              return cell
        
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        _=fourModel?.data![indexPath.section].album?[indexPath.row]
        
        if  jumpClosure != nil{
            urlstring="http://www.tudou.com/programs/view/gvB83qQ-x2E"
            jumpClosure!(urlstring!)
        }
//        if  addClosure != nil{
//            url=fourModel?.data![indexPath.section].album?[indexPath.row].picurl_200_300
//            
//        }
//        

    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 320, height: 54)
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader{
            let header=colletionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderReusableView
            header.backgroundColor=UIColor.blackColor()
            header.FourDataHeaderModel = fourModel?.data![indexPath.section]
             return header
        }
        return UICollectionReusableView()
    }
    

}
