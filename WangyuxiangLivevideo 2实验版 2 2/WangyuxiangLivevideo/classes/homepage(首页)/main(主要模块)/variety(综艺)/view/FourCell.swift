//
//  FourCell.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class FourCell: UITableViewCell {
    //点击事件
    var jumpClosure: IngreJumpClosure?
    
    
    //显示数据
    var homePageModel4: [Homescardsinf2]? {
        didSet {
            showData()
          
        }
    }
    
    func showData(){
        
        for i in 0...3{
            let imageData=homePageModel4![i]
            // let imageData=homePageModel4![i].skip_inf!.video_id
            
            let tmpView=contentView.viewWithTag(200+i)
            if tmpView?.isKindOfClass(UIImageView)==true{
                let btn=tmpView as! UIImageView
                if imageData.image_448_252 != nil{
                let url = NSURL(string:(imageData.image_448_252)!)
               btn.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
            }
            
            let tmpView1=contentView.viewWithTag(300+i)
            if tmpView1?.isKindOfClass(UILabel)==true{
                let imageTitleLabel=tmpView1 as! UILabel
                if imageData.image_b_r_title != nil{
                imageTitleLabel.text=imageData.image_b_r_title
                }
            }
           
            let tmpView2=contentView.viewWithTag(400+i)
            if tmpView2?.isKindOfClass(UILabel)==true{
                let TitleLabel=tmpView2 as! UILabel
                if imageData.title != nil{
                TitleLabel.text=imageData.title
                }
            }
            let subtitle=homePageModel4![i]
            let tmpView3=contentView.viewWithTag(500+i)
            if tmpView3?.isKindOfClass(UILabel)==true{
                let subTitleLabel=tmpView3 as! UILabel
                if subtitle.sub_title != nil{
                subTitleLabel.text=subtitle.sub_title
                }
                
                
            }
            
            
            
        }
        
    }
    
    @IBAction func btnClick(sender: UIButton) {
        let index=sender.tag-100
        if ((homePageModel4![index].skip_inf!.skip_url) != nil){
             urlstring = homePageModel4![index].skip_inf!.skip_url
           
           }else if homePageModel4![index].skip_inf?.video_id != nil{
            urlstring="http://www.tudou.com/programs/view/"+homePageModel4![index].skip_inf!.video_id!
        }else{
            urlstring = "http://www.tudou.com/programs/view/S0Ppc63qDg4"
        }
        if jumpClosure != nil{
            jumpClosure!(urlstring!)
       //"http://www.tudou.com/programs/view/187562"
        }
        // print(urlstring)
        
    }
    //创建cell的方法
    class func creatFourCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,homePageModel4:[Homescardsinf2]?)->FourCell{
        
        let cellId="fourCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? FourCell
        if nil == cell {
            
            cell=NSBundle.mainBundle().loadNibNamed("FourCell", owner: nil, options: nil).last as? FourCell
            
            
            
        }
        //显示数据
        cell!.homePageModel4=homePageModel4
        return cell!
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
