//
//  HomePageModel.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zhb. All rights reserved.
//channel_page_modules

import UIKit
import SwiftyJSON

class HomePageModel: NSObject {
    var channel_base_inf:AnyObject?
    var channel_page_labels:Array<HomePageschannelpagelabels>?
    var channel_page_modules:Array<HomePageschannelpagemodules>?
    var top_slide_area:HomePageslidearea?
    //解析
    class func parseData(data:NSData)->HomePageModel{
        let json=JSON(data:data)
        let model=HomePageModel()
        //第一组数据
        model.top_slide_area=HomePageslidearea.parseModel(json["top_slide_area"])
        //第二组数据
        var HomePageArray2=Array<HomePageschannelpagelabels>()
        for (_, subjson)in json["channel_page_labels"]{
            let HomeModel=HomePageschannelpagelabels.parseModel(subjson)
            HomePageArray2.append(HomeModel)
        }
        
        model.channel_page_labels=HomePageArray2
        //第三组数据
        var HomePageArray3=Array<HomePageschannelpagemodules>()
        for (_, subjson)in json["channel_page_modules"]{
            let HomeModel=HomePageschannelpagemodules.parseModel(subjson)
            HomePageArray3.append(HomeModel)
        }
        model.channel_page_modules=HomePageArray3
        
        return model
    }
}
//第一组
class HomePageslidearea:NSObject{
    var slideareaArray:Array<HomePagesCardsIf>!
    var cards_inf:String?
    // 解析
    class func parseModel(json:JSON)->HomePageslidearea{
        let model=HomePageslidearea()
        
        //滑动页数据
        var tmplideareaArray=Array<HomePagesCardsIf>()
        for (_, subjson)in json["cards_inf"]{
            let CardsIfModel=HomePagesCardsIf.parseModel(subjson)
            tmplideareaArray.append(CardsIfModel)
        }
        model.slideareaArray=tmplideareaArray
        return model
    }
}

class HomePagesCardsIf:NSObject{
    var  bottom_title:String!
    var  image_448_252:String!
    var  image_b_r_title:String!
    var  title:String!
    var  image_200_300:String!
    var  image_800_450:String!
    var  skip_inf:skipinfobject?
    
    //解析
    class func parseModel(json:JSON)->HomePagesCardsIf{
        let model=HomePagesCardsIf()
        model.bottom_title=json["bottom_title"].string
        model.image_448_252=json["image_448_252"].string
        model.image_b_r_title=json["image_b_r_title"].string
        model.title=json["title"].string
        model.image_200_300=json["image_200_300"].string
        model.image_800_450=json["image_800_450"].string
        model.skip_inf=skipinfobject.parseModel(json["skip_inf"])
      
        return model
    }
}
class skipinfobject:NSObject{
    
    var video_id:String?
    var skip_url:String?
    // 解析
    class func parseModel(json:JSON)->skipinfobject{
        let model=skipinfobject()
        model.video_id=json["video_id"].string
        model.skip_url=json["skip_url"].string
        
             return model
        
    }
}

//第二组
class HomePageschannelpagelabels:NSObject{
    var  label_title:String?
    var  label_type:String!
    var  label_id:NSNumber?
     var brief_filter:NSNumber?
    var  skip_inf:skipinfobject3?

    //解析
    class func parseModel(json:JSON)->HomePageschannelpagelabels{
        let model=HomePageschannelpagelabels()
        model.label_title=json["label_title"].string
        model.label_id=json["label_id"].number
        model.brief_filter=json["brief_filter"].number
   model.skip_inf=skipinfobject3.parseModel(json["skip_inf"])
        //print(model.label_title)
        //print(model.label_id)
        return model
    }
}

class skipinfobject3:NSObject{
    
    var brief_filter:String?
       // 解析
    class func parseModel(json:JSON)->skipinfobject3{
    let model=skipinfobject3()
    model.brief_filter=json["brief_filter"].string
   // print(model.brief_filter)
        return model
        
    }
}




//第三组
class HomePageschannelpagemodules:NSObject{
    var  title:String!
    var  cards_inf:Array<Homescardsinf2>?!
    //解析
    class func parseModel(json:JSON)->HomePageschannelpagemodules{
        let model=HomePageschannelpagemodules()
        model.title=json["title"].string
        var cardsinfArray=Array<Homescardsinf2>()
        for (_, subjson)in json["cards_inf"]{
            let CardsIfModel=Homescardsinf2.parseModel(subjson)
            cardsinfArray.append(CardsIfModel)
        }
        model.cards_inf=cardsinfArray
        
      
        return model
    }
}

class Homescardsinf2:NSObject{
    var  sub_title:String!
    var  title:String!
    var  image_b_r_title:String!
    var  image_200_300:String!
    var  image_448_252:String!
    var   skip_inf:skipinfobject2?
    //解析
    class func parseModel(json:JSON)->Homescardsinf2{
        let model=Homescardsinf2()
        model.sub_title=json["sub_title"].string
        model.title=json["title"].string
        model.image_b_r_title=json["image_b_r_title"].string
        model.image_200_300=json["image_200_300"].string
        model.image_448_252=json["image_448_252"].string
        model.skip_inf=skipinfobject2.parseModel(json["skip_inf"])
           return model
        
    }
    }

class skipinfobject2:NSObject{
    
    var video_id:String?
    var title:String?
    var skip_type:String?
    var skip_url:String?
    // 解析
    class func parseModel(json:JSON)->skipinfobject2{
        let model=skipinfobject2()
        
        
        model.skip_type=json["skip_type"].string
         model.video_id=json["video_id"].string
        model.skip_url=json["skip_url"].string
             

        return model
        
    }
}



