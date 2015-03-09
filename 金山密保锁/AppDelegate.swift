//
//  AppDelegate.swift
//  金山密保锁
//
//  Created by invoker on 15/2/3.
//  Copyright (c) 2015年 invoker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        let pc = PassClock()
        let tc = TimeCompare()
        let um = UserManage()
        let ma = MoreAbout()
        setupChildViewController(pc, _title:"珍珑密保锁")
        setupChildViewController(tc, _title:"时间校准")
        setupChildViewController(um, _title:"账号管理")
        setupChildViewController(ma, _title:"更多")
         let nvpc=UINavigationController(rootViewController:pc);
         let nvtc=UINavigationController(rootViewController:tc);
         let nvum=UINavigationController(rootViewController:um);
         let nvma=UINavigationController(rootViewController:ma);
        
        let navArr=[nvpc,nvtc,nvum,nvma]
        let tabBarController=UITabBarController();
        tabBarController.viewControllers=navArr;
        
        
        self.window!.rootViewController=tabBarController;
        return true
    }
    /**
    方法传参数
    
    :param: childVc Controller
    :param: _title  title
    还可以添加颜色等各种参数
    swift  func setupChildViewController(childVc: UIViewController,_title:String)
     oc     -(void) setupChildViewController:(UIViewController *)childVc
    
    使用:
    swift  setupChildViewController(pc, _title:"珍珑密保锁")
     oc    [self setupChildViewController:pc,"珍珑密保锁"];
    
    */
    func setupChildViewController(childVc: UIViewController,_title:String)
    {
        childVc.view.backgroundColor=UIColor(red: 0.110, green: 0.200, blue: 0.200, alpha: 1.000)

        childVc.title=_title
    }
 
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

//   setupChildViewController:(UIViewController *)childVc title:(NSString *) title imageName:(NSString *)imageName selectedImgName:(NSString *)selectedImageName
//    {
//    
//    childVc.view.backgroundColor=[UIColor whiteColor];
//    childVc.title=title;
//    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
//    childVc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:childVc];
//    [self addChildViewController:nav];
//    
//    }
    
  
}


