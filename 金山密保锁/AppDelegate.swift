
//
//  AppDelegate.swift
//  金山密保锁
//
//  Created by invoker on 15/2/3.
//  Copyright (c) 2015年 invoker. All rights reserved.
//

let WIDTH = UIScreen.mainScreen().bounds.size.width
let HEIGHT = UIScreen.mainScreen().bounds.size.height


let safeDeviceId = "98709376522"
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
        
        deviceModel()
        self.window!.rootViewController=tabBarController;
        return true
    }
    /**
    方法传参数
    
    - parameter childVc: Controller
    - parameter _title:  title
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
    
    
    func deviceModel()
    {
        
        let string: NSString = "你好你好你好"
        
        var systemInfo = utsname ()
        uname(&systemInfo)
        print(systemInfo.machine )
        
         let data = systemInfo.machine.dataUsingEncoding(NSUTF8StringEncoding)
        print(data)
//        var  version  = NSString(data: systemInfo.machine, encoding: NSUTF8StringEncoding)! as String
//     
//        print(version )

        
        
    }

//    + (NSString *) deviceModel;//设备型号
//    {
//    struct utsname systemInfo;
//    
//    uname(&systemInfo);
//    
//    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"设备型号是：%@",deviceString);
//    
//    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone";
//    
//    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//    
//    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//    
//    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//    
//    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
//    
//    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
//    
//    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//    
//    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
//    
//    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
//    
//    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
//    
//    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
//    
//    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
//    
//    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
//    
//    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
//    
//    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
//    
//    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    
//    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    
//    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    
//    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    
//    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
//    
//    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
//    
//    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2";
//    
//    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
//    
//    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2";
//    
//    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
//    
//    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3";
//    
//    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3";
//    
//    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
//    
//    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4";
//    
//    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
//    
//    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4";
//    
//    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
//    
//    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
//    
//    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
//    
//    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air2";
//    
//    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air2";
//    
//    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini 1G";
//    
//    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini 1G";
//    
//    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini 1G";
//    
//    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad mini 2";
//    
//    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad mini 2";
//    
//    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
//    
//    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad mini 3";
//    
//    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad mini 3";
//    
//    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
//    
//    
//    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
//    
//    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
//    
//    
//    if ([deviceString isEqualToString:@"iPad2,4"])    return @"iPhone 4";
//    if ([deviceString isEqualToString:@"iPad2,5"])    return @"iPhone 4";
//    NSLog(@"NOTE: Unknown device type: %@", deviceString);
//    
//    return deviceString;
//    }
    
  
}


