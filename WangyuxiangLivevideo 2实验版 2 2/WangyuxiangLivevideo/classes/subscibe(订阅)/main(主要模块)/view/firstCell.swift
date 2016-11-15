//
//  firstCell.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/7.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit
import SnapKit

class firstCell: UITableViewCell {

    @IBOutlet weak var btn1: UIButton!
    var jumpClosure: IngreJumpClosure?

    @IBAction func btnClick(sender: UIButton) {
         sender.selected = true
//         print("不要")
//    let alter=UIAlertController(title: "是否订阅", message: "亲!!！已经订阅成功", preferredStyle: .Alert)
//        let action1=UIAlertAction(title: "返回", style: .Default, handler: {(a) in
//           
//        })
//        //添加操作（即按钮）
//        alter.addAction(action1)
        //用模态化呈现UIAlertController
//        self.presentViewController(alter, animated: true, completion: nil)

           }
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
  
    @IBOutlet weak var imageName: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        config()
    }

    func config(){
      
        let btn=UIButton()
        btn1.addSubview(btn)
        btn.snp_makeConstraints(closure: { (make) in
            make.right.left.bottom.top.equalTo(btn1)
        })
       
//        btn.setTitle("+订阅", forState: .Normal)
//        btn.setTitle("完成", forState: .Selected)
        
        ///btn.setTitle("完成", forState: .Highlighted)
        //btn.setImage(UIImage(named: "ic_ipad_close.png"), forState: .Highlighted)
        btn.setImage(UIImage(named: "btn_rss_rss_normal_66x26_@1x.png"), forState: .Normal)
        btn.setImage(UIImage(named: "btn_rss_rss_press_66x26_@1x.png"), forState: .Selected)
//        btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
//        btn.setTitleColor(UIColor.redColor(), forState: .Highlighted)
//        btn.titleLabel?.textAlignment = .Left
//        btn.titleLabel?.font=UIFont.systemFontOfSize(15)
        btn.addTarget(self, action: #selector(btnClick(_:)), forControlEvents:.TouchUpInside)
    }
    
       override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
