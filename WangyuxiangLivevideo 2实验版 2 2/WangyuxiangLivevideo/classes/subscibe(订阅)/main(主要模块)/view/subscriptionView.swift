//
//  subscriptionView.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import MJRefresh

 public var urlone:String=firistUrl

class subscriptionView: UIView {
    var jumpClosure: IngreJumpClosure?
    private var tbView:UITableView?
   
    var dataArray:[firstModel1]=[]
    // var oneModel:FirstModel?
    //显示数据
    //点击事件
    //var jumpClosure:IngreJumpClourse?
    
//    var oneModel:FirstModel?{
//        didSet{
//            if oneModel != nil{
//                tbView?.reloadData()
//            }
//            
//        }
//       
//    }
//    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //创建表格
        tbView=UITableView(frame: CGRectZero,style: .Plain)
       tbView?.delegate=self
        tbView?.dataSource=self
       addSubview(tbView!)
        //loadData1()
        self.tbView!.registerNib(UINib(nibName: "firstCell", bundle: nil),forCellReuseIdentifier: "firstCellId")
        tbView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self)
        })
    }
    
    
//    func loadData11() {
//      Alamofire.request(.GET, urlone, parameters: nil, encoding: ParameterEncoding.URL, headers:nil).responseData { (reaponse) in
//            let data = reaponse.data
//            let model = FirstModel.parseData(data!)
//           print(model.items![0].title)
//            self.oneModel = model
//      }
//}
    
       func loadData1(){
        Alamofire.request(.GET,urlone).responseJSON(completionHandler: {[unowned self] (response) in
            if response.result.error==nil{

            let dic=response.result.value as! [String:AnyObject]
            let appArray=dic ["items"] as! [[String:AnyObject]]
            for dic in appArray{
                let model=firstModel1()
                model.setValuesForKeysWithDictionary(dic)
                self.dataArray.append(model)
            }
           self.tbView!.reloadData()
            }
         })
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



extension subscriptionView:UITableViewDelegate,UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("firstCellId", forIndexPath: indexPath) as! firstCell
        let model=dataArray[indexPath.row]
        cell.timeLabel.text=model.playtimes_str
        cell.titleLabel.text=model.title
//       cell.imageName.kf_setImageWithURL(NSURL(string: model.picUrl_200x112))
         cell.imageName.kf_setImageWithURL(NSURL(string: model.picUrl_200x112), placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        
   return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         let model=dataArray[indexPath.row]
        
    if model.playUrl != nil && jumpClosure != nil{
    urlstring=model.playUrl
      jumpClosure!(urlstring!)
           
        }
        
          }
}



