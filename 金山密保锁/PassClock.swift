//
//  PassClock.swift
//  金山密保锁
//
//  Created by invoker on 15/2/3.
//  Copyright (c) 2015年 invoker. All rights reserved.
//

import UIKit

class PassClock: UIViewController,UIScrollViewDelegate {
     var  nowDate = UILabel(frame:CGRectMake(5, 64, WIDTH, 20))//当前系统时间
     var  secondTime = UILabel()//还有多少秒刷新倒计时
    
    var progress = UIProgressView()//进图条
      var arr1 = [String]()//数据源数组
     var  cardA = UILabel()
     var  cardB = UILabel()
     var  cardC = UILabel()
     var  cardD = UILabel()
     var  cardE = UILabel()
     var  cardF = UILabel()
     var  allCard = [UILabel]()
     var  time2 = 30
    var imgView1 = UIImageView(frame: CGRectMake(0, 0, WIDTH, WIDTH-20))
    var imgView2 = UIImageView(frame: CGRectMake(WIDTH, 0, WIDTH, WIDTH-20))
    var imgView3 = UIImageView(frame: CGRectMake(WIDTH*2, 0, WIDTH, WIDTH-20))
    var imgView4 = UIImageView(frame: CGRectMake(WIDTH*3, 0, WIDTH, WIDTH-20))
    var imgView5 = UIImageView(frame: CGRectMake(WIDTH*4, 0, WIDTH, WIDTH-20))
    let imgScroll = UIScrollView(frame: CGRectMake(0, 84, WIDTH, WIDTH-20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view .addSubview(nowDate)
        //30s进度条
        progress.frame = CGRectMake(40, imgScroll.frame.origin.y+imgScroll.frame.size.height+10, WIDTH-80, 20)
        self.view.addSubview(progress)
        //倒计时lable
        secondTime.textColor = UIColor .whiteColor()
        let originalString: String = "密码将在30秒后刷新"
        let myString: NSString = originalString as NSString
        let size: CGSize = myString.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(16.0)])
         secondTime.font = UIFont.systemFontOfSize(16.0)
        secondTime.text = originalString
        secondTime.frame = CGRectMake((WIDTH-size.width)/2, progress.frame.origin.y+10, size.width, size.height)
        self.view .addSubview(secondTime)
        //浮动图片scrollview
        imgScroll.contentSize = CGSizeMake( WIDTH*5, 200)
        imgScroll.pagingEnabled = true
        imgScroll.backgroundColor = UIColor.grayColor()
        imgScroll.delegate = self
        imgScroll.showsHorizontalScrollIndicator = false
        self.view.addSubview(imgScroll)
        imgView1.image=UIImage(named: "img")
        imgView2.image=UIImage(named: "img")
        imgView3.image=UIImage(named: "img")
        imgView4.image=UIImage(named: "img")
        imgView5.image=UIImage(named: "img")
        imgScroll .addSubview(imgView1)
        imgScroll .addSubview(imgView2)
        imgScroll .addSubview(imgView3)
        imgScroll .addSubview(imgView4)
        imgScroll .addSubview(imgView5)
        //6个数字卡片
        allCard = [cardA, cardB, cardC,cardD, cardE, cardF]
        nowDate.textColor = UIColor .whiteColor()
        nowDate.text = "令牌时间 2015-12-10 10:54:14"
        addNumberCard()

        //安全码
        let safeId = UILabel(frame:CGRectMake(10, secondTime.frame.origin.y+secondTime.frame.size.height+55+20, 320, 20))
        safeId.textColor = UIColor .whiteColor()
        safeId.text = NSString(format: "序列号:%@",safeDeviceId) as String
        self.view .addSubview(safeId)
        
        addNsTime()
        progreseChanege()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNumberCard()
    {
        let cardNum = 6.0
        let appW  = 50.0
        let appH  = 55.0
        
        let somefloat = Double(WIDTH)
        
        let marginX = (somefloat - cardNum * appW) / ( cardNum + 1.0 )
        var marginY = 10
        for var index = 0; index < 6; ++index
        {
            let cardView = UIView()
            cardView.backgroundColor=UIColor.grayColor()
            cardView.layer.cornerRadius = 6
            cardView.layer.masksToBounds = true
            cardView.backgroundColor=UIColor.whiteColor()
            
            
            
            // appView.backgroundColor=[UIColor grayColor];
            //得出行 列
            var row  = Double(index/6)
            let col  = Double(index%6)
            
            let appX = marginX+col*appW+col*marginX
          
            
              let xgX = CGFloat(appX)
              let xgY = CGFloat(secondTime.frame.origin.y+secondTime.frame.size.height+10)
              let xgW = CGFloat(appW)
              let xgH = CGFloat(appH)
            cardView.frame=CGRectMake(xgX,xgY,xgW,xgH);
            let num =  arc4random_uniform(9)
            allCard[index] = UILabel(frame:CGRectMake(13, 8, 40, 40))
            allCard[index].text = String(num)
            allCard[index].font =  UIFont.systemFontOfSize(40)
            allCard[index].textColor = UIColor .blackColor()
           
           
            cardView.addSubview(allCard[index])

            self.view .addSubview(cardView)
            
        }
//
        
    }
    
      func addNsTime()
      {
        NSTimer .scheduledTimerWithTimeInterval(1.0, target: self, selector:Selector("timeChange"), userInfo: nil, repeats: true)
        //NSTimer .scheduledTimerWithTimeInterval(30, target: self, selector:Selector("progreseChanege"), userInfo: nil, repeats: true)
    }
    
    func arcNum() -> [String]

    {
        arr1 .removeAll()
       
        for var index = 0; index < 6; ++index
        {
           let num =  arc4random_uniform(9)
           arr1.append(String(num))
           allCard[index].text=(String(num))
        }
        print(arr1)
        return arr1
    }
    func timeChange()
    {
        let date:NSDate = NSDate()
        let formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.stringFromDate(date)
        //println(dateString)
        nowDate.text="令牌时间:"+dateString
      
      
        time2--
        if(time2 == 0)
        {
            time2 = 30
            arcNum()
            progreseChanege()
           
            }
         print(time2)
        secondTime.text = "密码将在" + (String(time2)) + "秒后刷新"
        
       
        
     }
   
    
    func progreseChanege()
    {
        print("进度条");
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(imgScroll.contentOffset)
        if(imgScroll.contentOffset.x==WIDTH*4)
        {
           imgScroll.contentOffset = CGPointMake(WIDTH, 0)
        }
        if(imgScroll.contentOffset.x==0)
        {
             imgScroll.contentOffset = CGPointMake(WIDTH*3, 0)
        }

        
        
        
    }
}
