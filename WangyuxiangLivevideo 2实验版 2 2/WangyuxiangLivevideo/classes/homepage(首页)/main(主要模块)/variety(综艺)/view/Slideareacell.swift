//
//  Slideareacell.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

public typealias IngreJumpClosure = (String -> Void)

class Slideareacell: UITableViewCell {
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonLabel: UILabel!

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    //显示数据
     var timer:NSTimer!
     var jumpClosure: IngreJumpClosure?
    var slideareaArray:Array<HomePagesCardsIf>?{
        didSet{
            //显示数据
            showData()
            
        }
        
    }
    //显示数据
    
    private func showData(){
        
        //遍历添加图片
        let cnt=slideareaArray?.count
       
        if slideareaArray?.count>0{
            //滚动视图加约束
            //创建一个容器视图
            let containerView=UIView.createView()
            scrollView.addSubview(containerView)
            containerView.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(scrollView)
                // 设置高度
                make.height.equalTo(scrollView)
            })
            //循坏设置子视图约束,
            var lastView:UIView?=nil
            for i in 0..<cnt!{
                let model=slideareaArray![i]
              
                //创建图片
                let tmpImageView=UIImageView()
                let url = NSURL(string: model.image_800_450!)
                 tmpImageView.tag = 100+i
                tmpImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                containerView.addSubview(tmpImageView)
                //添加点击事件
                tmpImageView.userInteractionEnabled = true
                tmpImageView.tag = 200+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
                tmpImageView.addGestureRecognizer(g)

            
                let label=UILabel()
                tmpImageView.addSubview(label)
                label.snp_makeConstraints(closure: { (make) in
                    make.bottom.left.equalTo(tmpImageView)
                    make.width.equalTo(200)
                    make.height.equalTo(28)
                })
                label.text=model.image_b_r_title
                let labelTitle=UILabel()
                tmpImageView.addSubview(labelTitle)
                
                labelTitle.snp_makeConstraints(closure: { (make) in
                    make.left.equalTo(tmpImageView)
                    make.width.equalTo(200)
                    make.height.equalTo(28)
                    make.bottom.equalTo(label.snp_top).offset(8)
                })
                labelTitle.text=model.title
                label.textColor=UIColor.redColor()
                labelTitle.textColor=UIColor.orangeColor()
               

                
               
               //图片的约束
                tmpImageView.snp_makeConstraints(closure: { (make) in
                    make.top.bottom.equalTo(containerView)
                    make.width.equalTo(scrollView)
                    if lastView==nil{
                        make.left.equalTo(containerView)
                    }else{
                        make.left.equalTo((lastView?.snp_right)!)
                    }
                })
              
                lastView=tmpImageView
            }
            //3.修改container的宽度
            containerView.snp_makeConstraints(closure: { (make) in
                make.right.equalTo(lastView!)
            })
            //4.分页控件

            scrollView.delegate=self
            pageControl.numberOfPages=cnt!
         
        }
//       timer=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timeRun), userInfo: nil, repeats: false)
    }
    func timeRun(){
        UIView.animateWithDuration(0.5, animations: {[unowned self] in
            self.scrollView.contentOffset=CGPointMake(screenWidth, 0)
        }) {[unowned self] (b) in
            self.scrollViewDidEndDecelerating(self.scrollView)
        }
    }

    //创建cell的方法
    class func creatBannerCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,slideareaArray:[HomePagesCardsIf]?)->Slideareacell{
        
        let cellId="SlideareacellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? Slideareacell
        if nil == cell {
            //IngreBannerCell.xib
            cell=NSBundle.mainBundle().loadNibNamed("Slideareacell", owner: nil, options: nil).last as? Slideareacell
    
        }
        //显示数据
    
        cell!.slideareaArray=slideareaArray
        return cell!
        
    }
    
    
    func tapImage(g: UIGestureRecognizer) {
        
        let index = (g.view?.tag)! - 200
        //获取点击的数据
      if ((slideareaArray![index].skip_inf!.video_id) != nil) && currentUrl != VarietyUrl && jumpClosure != nil{
           urlstring="http://www.tudou.com/programs/view/"+slideareaArray![index].skip_inf!.video_id!
      }else if ((slideareaArray![index].skip_inf!.skip_url) != nil) && currentUrl != VarietyUrl {
        urlstring=(slideareaArray![index].skip_inf!.skip_url)
        }
        if jumpClosure != nil  {
           jumpClosure!(urlstring!)
        }
       
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
extension Slideareacell:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index=scrollView.contentOffset.x/scrollView.bounds.size.width
        
        pageControl.currentPage=Int(index)
//        timer.invalidate()
//        timer=NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(timeRun), userInfo: nil, repeats: false)
            }
}

