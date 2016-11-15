//
//  HomePageView.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

public var urlstring:String?

class HomePageView: UIView{
    var jumpClosure:IngreJumpClosure?
    var webView:UIWebView!
    
    //数据
    var model:HomePageModel?{
        didSet{
            //set方法调用之后会调用这里方法
            tableView?.reloadData()
        }
    }
    
    //数据
    var model1:skipinfobject?{
        didSet{
            }
    }
    
    //表格
    private var tableView:UITableView?
    //重新实现初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        //创建表格视图
        tableView=UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight-64), style: .Plain)
        tableView?.dataSource=self
        tableView?.delegate=self
        addSubview(tableView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:UITableView代理方法
extension HomePageView:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if currentUrl==movieUrl{
            return (model?.channel_page_modules?.count)!-1
        }
        return (model?.channel_page_modules?.count)!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //banner广告Section显示一行
        var row=0
        if section==0||section==1{
            row=1
            
        }else if section==1 {
            row=1
            
        }else if section>1&&currentUrl != movieUrl{
            row=1
            
        }else if section>1&&currentUrl == movieUrl{
            row=2
        }
        return row
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat=0
        if indexPath.section==0{
            height=180
            
        }else if indexPath.section==1 && currentUrl == carUrl||indexPath.section==1 && currentUrl == cryUrl||indexPath.section==1 && currentUrl == happyLifeUrl{
            height=50
            
        }else if indexPath.section==1 && currentUrl != OriginalUrl{
            height=100
            
        }  else if indexPath.section==1 && currentUrl == OriginalUrl{
            height=0
            
        } else if indexPath.section>1 && currentUrl != movieUrl {
            height=400
            
        }else if indexPath.section>1 && currentUrl == movieUrl{
            height=210
        }
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section==0{
            let cell=Slideareacell.creatBannerCellFor(tableView, atIndexPath: indexPath, slideareaArray: model!.top_slide_area!.slideareaArray)
            cell.jumpClosure=jumpClosure
            return cell
            
            }else if indexPath.section==1 && currentUrl == carUrl||indexPath.section==1 && currentUrl == cryUrl||indexPath.section==1 && currentUrl == happyLifeUrl{
            let cell=FourLabelCell.creatFourLabelCellFor(tableView, atIndexPath: indexPath, homemodel1: model!.channel_page_labels!)
            return cell
            
            }else if indexPath.section==1 && currentUrl != OriginalUrl{
            let cell=HomePageHotCell.creathomeCellFor(tableView, atIndexPath: indexPath, homemodel:model!.channel_page_labels!)
            return cell
            }
        else if indexPath.section>1 && currentUrl != movieUrl {
            var array1:[Homescardsinf2]=[]
            for i in 0...3{
                array1.append((model?.channel_page_modules![indexPath.section].cards_inf!![i])!)
                }
            
            let cell=FourCell.creatFourCellFor(tableView, atIndexPath: indexPath, homePageModel4:array1)
            cell.jumpClosure=jumpClosure
            return cell
        }else if indexPath.section>1 && currentUrl==movieUrl {
            if indexPath.row == 0 {
                var array:[Homescardsinf2]=[]
                for i in 0...2{
                    array.append((model?.channel_page_modules![indexPath.section].cards_inf!![i])!)
                }
                let cell=AllCell.creatAllCellFor(tableView, atIndexPath: indexPath, homePageModel1:array)
                cell.jumpClosure=jumpClosure
                return cell
            }
            else if indexPath.row==1{
                var array1:[Homescardsinf2]=[]
                for i in 3...5{
                    array1.append((model?.channel_page_modules![indexPath.section].cards_inf!![i])!)
                }
                let cell=AllCell.creatAllCellFor(tableView, atIndexPath: indexPath, homePageModel1:array1)
                cell.jumpClosure=jumpClosure
                return cell
            }
        }
        return UITableViewCell()
        
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section==0&&currentUrl==movieUrl{
            let likeHeaderView=HomePageHeaderView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 44))
            return likeHeaderView
        }
            
        else if  section>1 && currentUrl != VarietyUrl && currentUrl != happyLifeUrl && currentUrl != gameUrl{
            let HeaderView=AllHeardView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 30))
            HeaderView.allModel=model?.channel_page_modules![section]
            
            return HeaderView
        }
        
        
        return nil
        
    }
    
    //设置header的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==0&&currentUrl==movieUrl{
            return 44
            
        }
            
        else if section>1 && currentUrl != VarietyUrl && currentUrl != happyLifeUrl && currentUrl != gameUrl {
            return 54
        }
        return 0
    }
    
    //去掉UITableView的粘滞性
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let h: CGFloat = 54
        if scrollView.contentOffset.y >= h {
            scrollView.contentInset = UIEdgeInsetsMake(-h, 0, 0, 0)
            
        }else if scrollView.contentOffset.y > 0 {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0)
        }
    }
}













