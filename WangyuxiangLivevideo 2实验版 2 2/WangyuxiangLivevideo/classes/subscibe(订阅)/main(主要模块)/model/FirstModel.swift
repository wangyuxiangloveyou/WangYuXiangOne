//
//  FirstModel.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/5.
//  Copyright © 2016年 zhb. All rights reserved.
//


import SwiftyJSON
import  UIKit

class FirstModel: NSObject {
    var page_size:String?
    var total:String?
    var items:[itemsArray]?
    //解析
    class func parseData(data:NSData)->FirstModel{
        let json=JSON(data:data)
       let model=FirstModel()
        //第1组数据
        var array1=Array<itemsArray>()
        for (_, subjson)in json["items"]{
            let itemModel=itemsArray.parseModel(subjson)
           array1.append(itemModel)
        }
        
       model.items=array1
     
        return model

}
}
    class itemsArray:NSObject{
        var  title:String?
        var  picUrl_200x112:String!
        var  playUrl:String?
        var itemId:NSNumber?
        var  playtimes:String?
         var playtimes_str:String?
        //解析
        class func parseModel(json:JSON)->itemsArray{
            let model=itemsArray()
            model.title=json["title"].string
            model.playUrl=json["playUrl"].string
            model.picUrl_200x112=json["picUrl_200x112"].string
            model.itemId=json["itemId"].number
            model.playtimes=json["playtimes"].string
            model.playtimes_str=json["playtimes_str"].string
            return model
          
}
}






