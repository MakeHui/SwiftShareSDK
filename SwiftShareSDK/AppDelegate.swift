//
//  AppDelegate.swift
//  SwiftShareSDK
//
//  Created by MakeHui on 4/3/16.
//  Copyright © 2016 MakeHui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // ShareSDK 后台的开发者KEY
        ShareSDK.registerApp("807e39c0a100")
        
        
        // 下面分别要填写的String类型的值, 都是需要到个个平台太去申请的
        
        // 微信
        ShareSDK.connectWeChatWithAppId("wx7259198a010a442b", appSecret: "d4624c36b6795d1d99dcf0547af5443d", wechatCls: WXApi.classForCoder())
        //微信好友
        ShareSDK.connectWeChatSessionWithAppId("wx7259198a010a442b", wechatCls:WXApi.classForCoder())
        //微信朋友圈
        ShareSDK.connectWeChatTimelineWithAppId("wx7259198a010a442b", wechatCls: WXApi.classForCoder())
        // 新浪微博
        ShareSDK.connectSinaWeiboWithAppKey("2883129486", appSecret: "ae926077609479eb7b46417dd0adfb06", redirectUri: "http://www.sina.com")
        //QQ
        ShareSDK.connectQQWithAppId("101165144", qqApiCls:QQApiInterface.classForCoder())
        //QQ空间
        ShareSDK.connectQZoneWithAppKey("101165144", appSecret: "b8e4e1e7af7bb07e647e036c34b868bd", qqApiInterfaceCls: QQApiInterface.classForCoder(), tencentOAuthCls: TencentOAuth.classForCoder())
        ShareSDK.connectQQWithQZoneAppKey("101165144", qqApiInterfaceCls: QQApiInterface.classForCoder(), tencentOAuthCls: TencentOAuth.classForCoder())
        // 腾讯微博
        ShareSDK.connectTencentWeiboWithAppKey("101165144", appSecret: "b8e4e1e7af7bb07e647e036c34b868bd", redirectUri: "http://www.sharesdk.cn")
        //链接微信
        //短信
        ShareSDK.connectSMS()
        //连接邮件
        ShareSDK.connectMail()
        
        return true
    }
    
    // 如果不重写这两个方法, 在分享成功后无法收到应用回调, 到诊无法获取到信息
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return ShareSDK.handleOpenURL(url, wxDelegate: self)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return ShareSDK.handleOpenURL(url, sourceApplication: sourceApplication, annotation: annotation, wxDelegate: self)
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


}

