//
//  PassClock.swift
//  金山密保锁
//
//  Created by invoker on 15/2/3.
//  Copyright (c) 2015年 invoker. All rights reserved.
//

import UIKit

class PassClock: UIViewController {
     let  time = UILabel(frame:CGRectMake(5, 64, 320, 20))//当前系统时间
     var  secondTime = UILabel(frame:CGRectMake(80, 300, 320, 20))//还有多少秒刷新
    let progress = UIProgressView(frame: CGRectMake(80, 290, 160, 10))//进图条
     var arr1 = [String]()//数据源数组
     var  cardA = UILabel()
     var  cardB = UILabel()
     var  cardC = UILabel()
     var  cardD = UILabel()
     var  cardE = UILabel()
     var  cardF = UILabel()
     var  allCard = [UILabel]()
     var  time2 = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCard = [cardA, cardB, cardC,cardA, cardB, cardC]
        time.textColor = UIColor .whiteColor()
        time.text = "令牌时间 2015-12-10 10:54:14"
        
        self.view .addSubview(time)
        
        let imgScroll = UIScrollView(frame: CGRectMake(0, 84, 320, 200))
        imgScroll.contentSize = CGSizeMake( 960, 200)
        imgScroll.pagingEnabled = true
        imgScroll.backgroundColor = UIColor.grayColor()
         self.view.addSubview(imgScroll)
        var imgView1 = UIImageView(frame: CGRectMake(0, 0, 320, 200))
        var imgView2 = UIImageView(frame: CGRectMake(320, 0, 320, 200))
        var imgView3 = UIImageView(frame: CGRectMake(640, 0, 320, 200))
        imgView1.image=UIImage(named: "img")
        imgView2.image=UIImage(named: "img")
        imgView3.image=UIImage(named: "img")
        imgScroll .addSubview(imgView1)
        imgScroll .addSubview(imgView2)
        imgScroll .addSubview(imgView3)
        
        progress.progress=0
        self.view.addSubview(progress)
        
        secondTime.textColor = UIColor .whiteColor()
        secondTime.text = "密码将在30秒后刷新"
        self.view .addSubview(secondTime)
        
        addNumberCard()
        
        let safeId = UILabel(frame:CGRectMake(10, 390, 320, 20))
        safeId.textColor = UIColor .whiteColor()
        safeId.text = "序列号:98709376522"
        self.view .addSubview(safeId)
        addNsTime()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNumberCard()
    {
        var cardNum = 6.0
        var appW  = 50.0
        var appH  = 55.0
        var width  = self.view.frame.width
        let somefloat = Double(width)
        
        var marginX = (somefloat - cardNum * appW) / ( cardNum + 1.0 )
        var marginY = 10
        for var index = 0; index < 6; ++index
        {
            var cardView = UIView()
            cardView.backgroundColor=UIColor.grayColor()
            cardView.layer.cornerRadius = 6
            cardView.layer.masksToBounds = true
            cardView.backgroundColor=UIColor.whiteColor()
            
            
            
            // appView.backgroundColor=[UIColor grayColor];
            //得出行 列
            var row  = Double(index/6)
            var col  = Double(index%6)
            
            var appX = marginX+col*appW+col*marginX
            var appY : Float = 330.0
            
            var xgX = CGFloat(appX)
              var xgY = CGFloat(appY)
              var xgW = CGFloat(appW)
              var xgH = CGFloat(appH)
            cardView.frame=CGRectMake(xgX,xgY,xgW,xgH);
            var num =  arc4random_uniform(9)
            allCard[index] = UILabel(frame:CGRectMake(13, 8, 40, 40))

            allCard[index].text = String(num)
            allCard[index].font =  UIFont.systemFontOfSize(40)
            allCard[index].textColor = UIColor .blackColor()
           
           
            cardView .addSubview(allCard[index])

            self.view .addSubview(cardView)
            
        }
//
        
    }
    
      func addNsTime()
      {
        NSTimer .scheduledTimerWithTimeInterval(1.0, target: self, selector:Selector("timeChange"), userInfo: nil, repeats: true)
         NSTimer .scheduledTimerWithTimeInterval(2.0, target: self, selector:Selector("arcNum"), userInfo: nil, repeats: true)
        NSTimer .scheduledTimerWithTimeInterval(0.1, target: self, selector:Selector("progreseChanege"), userInfo: nil, repeats: true)
    }
    
    func arcNum() -> [String]

    {
        arr1 .removeAll()
       
        for var index = 0; index < 6; ++index
        {
           var num =  arc4random_uniform(9)
           arr1.append(String(num))
           allCard[index].text=(String(num))
        }
        println(arr1)
        return arr1
    }
    func timeChange()
    {
        var date:NSDate = NSDate()
        var formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var dateString = formatter.stringFromDate(date)
        //println(dateString)
        time.text="令牌时间:"+dateString
      
      
        time2--
        if(time2 == -1)
        {
            time2 = 30
        }
         println(time2)
        secondTime.text = "密码将在" + (String(time2)) + "秒后刷新"
        
       
        
     }
    func progreseChanege()
    {
      self.progress.progress = ((Float(( 30.00 - (Float(self.time2)) ) / 30.00)))
        println((Float(( 30.00 - (Float(self.time2)) ) / 30.00)))
    self.progress.time
    
    
    

    }
}
