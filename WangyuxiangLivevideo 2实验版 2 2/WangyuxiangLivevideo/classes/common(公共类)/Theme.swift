//
//  Theme.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zhb. All rights reserved.
//

import Foundation
import UIKit


let screenWidth=UIScreen.mainScreen().bounds.width
let screenHeight=UIScreen.mainScreen().bounds.height
//英雄联盟//http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=15&tagType=1&tags=2258&pg=1&pz=30&sort=pubTime

 //http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=6&tagType=3&tags=2&pg=1&pz=30&sort=quality
// //http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=3&tagType=3&tags=&pg=1&pz=30&sort=quality
//http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=130&tagType=3&tags=-1&pg=1&pz=30&sort=quality



       //美国http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=5&tagType=3&tags=80%2C1686&pg=1&pz=30&sort=pubTime
//let labelUrl="http://api.3g.tudou.com/v4_3/channel/label_top?pid=35a871d7c541ba6b&_t_=1478165538&_e_=md5&_s_=10c24223105a75c9fdf5f34c69c68ace&guid=3bf34a10846b77add7812470b42d6bc7&ver=5.8.5&network=WIFI&operator=CMCC_46002&page_no=1&page_size=30&module_id=131&module_prot_id=106"
//http://rec.api.3g.tudou.com/v5/user/rec_videos?pid=35a871d7c541ba6b&_t_=1478165212&_e_=md5&_s_=eb45157f6ce9bbf12aa6fe1c0d64cb7e&guid=3bf34a10846b77add7812470b42d6bc7&ver=5.8.5&network=WIFI&operator=CMCC_46002
//let myUrl="http://rec.api.3g.tudou.com/v5/user/rec_videos?pid=35a871d7c541ba6b&_t_=1477920871&_e_=md5&_s_=b117793f6139a5a711491c7ccf9e7ea8&guid=3bf34a10846b77add7812470b42d6bc7&ver=5.8.5&network=WIFI&operator=CMCC_46002"

//发现

//http://discover.api.3g.tudou.com/v4_7/rec_discover?pid=35a871d7c541ba6b&_t_=1478164547&_e_=md5&_s_=ff7aa682ac771a37f585c7a49983cdba&guid=3bf34a10846b77add7812470b42d6bc7&ver=5.8.5&network=WIFI&operator=CMCC_46002

let findUrl="http://discover.api.3g.tudou.com/v4_7/rec_discover?pid=35a871d7c541ba6b&ver=5.8.5&network=WIFI&operator=CMCC_46002"






//http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=21
//搞笑
let cryUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=5"
let carUrl = "http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=26"
let growUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=25"
//综艺
let VarietyUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=31"
let gameUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=10"
//电视剧
let teleplayUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=30"
//电影
let movieUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=22"

//达人直播
let seedingUrl="http://cms.laifeng.com/cms/youku/sdk/center/talent/get?pageNo=1&limit=18"
//关注
let ConcernUrl="http://adash.m.taobao.com/rest/sur?ak=23033760&av=5.8.5&c=0&v=3.0&s=6589aa6282223551d6a4b49a7b0c19364d5e1cff&d=WAgrFKuUIiwDABa4I5GMqRWA&sv=4.3.8&p=a&t=1476975398378&u=&is=1"
//动漫
let AnimationUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=14"
//音乐music无
let musicUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=1"
//娱乐无
let amusementUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=1"
//搞笑
let FunnyUrl = "http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=5"
//少儿Children无
let ChildrenUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=10001"
//生活life
let lifeUrl = "http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=3"
//会员member
let memberUrl = "http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=422"
//体育url
let sportUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=15"
//时尚urlfashion
let fashionUrl = "http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=32"
//精彩专题Special
let SpecialUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=10024"
//原创
let OriginalUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&_t_=1478175706&network=WIFI&operator=CMCC_46002&cid=99"
//乐活
let happyLifeUrl="http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=3"



//电影  

//http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=5&tagType=3&tags=92&pg=1&pz=30&sort=quality
 //http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=5&tagType=3&tags=100&pg=1&pz=30&sort=quality
//乐活
//http://api.3g.tudou.com/v4_3/channel/label_top?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&page_no=1&page_size=30&module_id=845&module_prot_id=109
 //http://api.3g.tudou.com/v4_3/channel/label_top?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&page_no=1&page_size=30&module_id=848&module_prot_id=121

//汽车
//http://api.3g.tudou.com/v4_3/channel/label_top?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&page_no=1&page_size=30&module_id=592&module_prot_id=145

//http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=9&tagType=1&tags=&pg=1&pz=30&sort=quality
// 搞笑
//http://api.3g.tudou.com/pianku/videos?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&firstTagId=7&tagType=1&tags=&pg=1&pz=30&sort=pubTime


//http://user.api.3g.tudou.com/v4_4/user/playlists?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&user_id=357550037&page_no=1&page_size=10

//做//http://discover.api.3g.tudou.com/v4_7/channelsquare?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&keywords=%E9%9F%B3%E4%B9%90_&gender=0&fc=0&qualityUser=0&userType=1%2C2&orderByField=subedCount3day&orderByType=desc&pg=1&pz=30

//http://discover.api.3g.tudou.com/v4_7/channelsquare?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&keywords=%E4%BD%93%E8%82%B2_&gender=0&fc=0&qualityUser=0&userType=1%2C2&orderByField=subedCount3day&orderByType=desc&pg=1&pz=30

 //http://api.3g.tudou.com/v4/channel/comic_listing?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&channel_id=0

//let thirdUrl="http://user.api.3g.tudou.com/v4/user/ugc_list?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&user_ids=90345247&page_size=30&sort_desc_by=pub"
let thirdUrl="http://user.api.3g.tudou.com/v4/user/ugc_list?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&user_ids=333057554&page_size=30&sort_desc_by=pub"
//订阅//二次元"
let firistUrl="http://user.api.3g.tudou.com/v4/user/ugc_list?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&user_ids=86317397&page_size=30&sort_desc_by=pub"

//
let secondUrl="http://user.api.3g.tudou.com/v4/user/ugc_list?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&user_ids=114357319&page_size=30&sort_desc_by=pub"

  let fourUrl="http://api.3g.tudou.com/v4/channel/comic_listing?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&channel_id=0"
let fourUrlDetail="http://rec.api.3g.tudou.com/v5/video/relevan/rec?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&itemCode=gvB83qQ-x2E&pg=1&pz=16"

//收藏="http://api.3g.tudou.com/v5/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&excludeNew=0&show_url=1&live=1"


//http://rec.api.3g.tudou.com/v5/video/relevan/rec?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&itemCode=5P0x37iGTdM&pg=1&pz=16
//http://www.tudou.com/programs/view/GCl5IPcio48


//http://www.tudou.com/programs/view/gvB83qQ-x2E

let collectUrl="http://api.3g.tudou.com/v5/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&excludeNew=0&show_url=1&live=1"
