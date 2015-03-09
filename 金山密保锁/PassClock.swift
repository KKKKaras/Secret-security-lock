//
//  PassClock.swift
//  金山密保锁
//
//  Created by invoker on 15/2/3.
//  Copyright (c) 2015年 invoker. All rights reserved.
//

import UIKit

class PassClock: UIViewController {
     let  time = UILabel(frame:CGRectMake(5, 64, 320, 20))
     var numlaber = UILabel(frame:CGRectMake(13, 8, 40, 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        let progress = UIProgressView(frame: CGRectMake(80, 290, 160, 10))
        progress.progress=0.3
        self.view.addSubview(progress)
        
        let secondTime = UILabel(frame:CGRectMake(80, 300, 320, 20))
        secondTime.textColor = UIColor .whiteColor()
        secondTime.text = "密码将在29秒后刷新"
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
           
            numlaber.text = String(num)
            numlaber.font =  UIFont.systemFontOfSize(40)
            numlaber.textColor = UIColor .blackColor()
            numlaber.tag=index
           
            cardView .addSubview(numlaber)

            self.view .addSubview(cardView)
            
        }
//
        
    }
    
      func addNsTime()
      {
        NSTimer .scheduledTimerWithTimeInterval(1.0, target: self, selector:Selector("timeChange"), userInfo: nil, repeats: true)
         NSTimer .scheduledTimerWithTimeInterval(2.0, target: self, selector:Selector("arcNum"), userInfo: nil, repeats: true)
    }
    
    func arcNum() -> [String]

    {
        var arr1 = [String]()
        for var index = 0; index < 6; ++index

        {
           var num =  arc4random_uniform(9)
           arr1.append(String(num))
        
        
           
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
    }

}
