//
//  FourImageModel.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/8.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit
import SwiftyJSON

class FourImageModel: NSObject {
    var code:NSNumber?
    var data:[dataArray]?
    //解析
    class func parseData(data:NSData)->FourImageModel{
        let json=JSON(data:data)
        let model=FourImageModel()
        //第1组数据
        var array1=[dataArray]()
        for (_, subjson)in json ["data"]{
            let datamodel=dataArray.parseModel(subjson)
         array1.append(datamodel)
        }
        model.data=array1
          return model
}
}

class dataArray:NSObject{
    var  album:[albumArray]?
    var  weekday:String!
    var  week:String?
    var data:String?
   //解析
    class func parseModel(json:JSON)->dataArray{
        let model=dataArray()
        model.weekday=json["weekday"].string
        model.week=json["week"].string
        model.data=json["data"].string
        var array2=[albumArray]()
        for (_, subjson)in json ["album"]{
            let datamodel2=albumArray.parseModel(subjson)
            array2.append(datamodel2)
        }
        model.album=array2
        return model
          }
}

class albumArray:NSObject{
    var  sub_cat:String?
    var  title:String!
    var  update_episode:String?
    var  picurl_200_300:String?
    var  album_id:String?
    var area_name:String?
    //解析
    class func parseModel(json:JSON)->albumArray{
        let model=albumArray()
        model.sub_cat=json["sub_cat"].string
        model.title=json["title"].string
        model.update_episode=json["update_episode"].string
        model.picurl_200_300=json["picurl_200_300"].string
        model.album_id=json["album_id"].string
        model.area_name=json["area_name"].string
        //print(model.picurl_200_300)
        return model
        
         }
}

