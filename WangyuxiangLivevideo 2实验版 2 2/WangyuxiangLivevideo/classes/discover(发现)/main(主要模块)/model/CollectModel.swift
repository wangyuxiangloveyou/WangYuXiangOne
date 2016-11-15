//
//  HomePageModel.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zhb. All rights reserved.
//channel_page_modules

import UIKit
import SwiftyJSON

class CollectModel: NSObject {
   var index_page_modules:Array<indexPageschannelpagemodules>?
  
    //解析
    class func parseData(data:NSData)->CollectModel{
        let json=JSON(data:data)
        let model=CollectModel()
        //第三组数据
        var indexPageArray3=Array<indexPageschannelpagemodules>()
        for (_, subjson)in json["index_page_modules"]{
            let indexModel=indexPageschannelpagemodules.parseModel(subjson)
            indexPageArray3.append(indexModel)
        }
        model.index_page_modules=indexPageArray3
        
        return model
    }
}

//第三组
class indexPageschannelpagemodules:NSObject{
    var  title:String!
    var  cards_inf:Array<indexcardsinf2>?!
    //解析
    class func parseModel(json:JSON)->indexPageschannelpagemodules{
        let model=indexPageschannelpagemodules()
        model.title=json["title"].string
        var cardsinfArray=Array<indexcardsinf2>()
        for (_, subjson)in json["cards_inf"]{
            let CardsIfModel=indexcardsinf2.parseModel(subjson)
            cardsinfArray.append(CardsIfModel)
        }
        model.cards_inf=cardsinfArray
        return model
    }
}

class indexcardsinf2:NSObject{
    var  sub_title:String!
    var  title:String!
    var  image_b_r_title:String!
    var  image_200_300:String!
    var  image_448_252:String!
    var   skip_inf:Indexskip?
    var   bottom_title:String?
    //解析
    class func parseModel(json:JSON)->indexcardsinf2{
        let model=indexcardsinf2()
        model.sub_title=json["sub_title"].string
        model.title=json["title"].string
        model.image_b_r_title=json["image_b_r_title"].string
        model.image_200_300=json["image_200_300"].string
        model.image_448_252=json["image_448_252"].string
        model.bottom_title=json["bottom_title"].string
        model.skip_inf=Indexskip.parseModel(json["skip_inf"])
        return model
        
    }
}

class Indexskip:NSObject{
    
    var video_id:String?
    var title:String?
    var skip_type:String?
    var skip_url:String?
    // 解析
    class func parseModel(json:JSON)->Indexskip{
        let model=Indexskip()
        
        
        model.skip_type=json["skip_type"].string
        model.video_id=json["video_id"].string
        model.skip_url=json["skip_url"].string
        
        
        return model
        
    }
}




