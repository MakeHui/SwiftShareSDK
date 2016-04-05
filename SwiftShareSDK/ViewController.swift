//
//  ViewController.swift
//  SwiftShareSDK
//
//  Created by MakeHui on 4/3/16.
//  Copyright © 2016 MakeHui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !WXApi.isWXAppInstalled() {
            print("没有安装微信~")
        }
        
        if !QQApi.isQQInstalled() {
            print("没有安装QQ~")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareTouchUpInside(sender: AnyObject) {
        let url = "http://huyaohui.com/Niconiconi/"
        // var image: ISSCAttachment = ShareSDK.imageWithUrl(urlString)
        let image: ISSCAttachment? = nil
        let title: String = "来自SwiftShareSDK分享"
        let description: String = "あの日見た花の名前を僕達はまだ知らない。 http://huyaohui.com/Niconiconi/"
        let defaultContent: String = "这里是默认输入的内容"
        
        // 构造分享内容
        let publishContent = ShareSDK.content(title, defaultContent: defaultContent, image: image, title: title, url: url, description: description, mediaType: SSPublishContentMediaTypeNews)
        
        ShareSDK.showShareActionSheet(nil, shareList: nil, content: publishContent, statusBarTips: true, authOptions: nil, shareOptions: nil) { (type: ShareType, state: SSResponseState, statusInfo: ISSPlatformShareInfo!, error: ICMErrorInfo!, end: Bool) -> Void in
            
            // 判断分享时的状态
            if state.rawValue == SSResponseStateBegan.rawValue {
                print("开始分享~")
            }
            else if state.rawValue == SSResponseStateSuccess.rawValue {
                print("success~")
            }
            else if state.rawValue == SSResponseStateFail.rawValue {
                print("分享失败~")
                print(error)
            }
            else if state.rawValue == SSResponseStateCancel.rawValue {
                print("用户点击取消分享~")
            }
            
            // 判断用户分享到那个平台
            if type.rawValue == ShareTypeSinaWeibo.rawValue {
                print("新浪微博分享")
            }
            else if type.rawValue == ShareTypeTencentWeibo.rawValue {
                print("腾讯微博分享")
            }
            else if type.rawValue == ShareTypeQQ.rawValue {
                print("QQ分享")
            }
            else if type.rawValue == ShareTypeQQSpace.rawValue {
                print("QQ空间分享")
            }
            else if type.rawValue == ShareTypeWeixiSession.rawValue {
                print("微信好友分享")
            }
            else if type.rawValue == ShareTypeWeixiTimeline.rawValue {
                print("微信朋友圈分享")
            }
            // ...
        }
    }
    
    @IBAction func loginTouchUpInside(sender: AnyObject) {
        // 需要调用的第三方平台
        // var shareType: ShareType = ShareTypeQQSpace
        let shareType: ShareType = ShareTypeWeixiTimeline
        
        ShareSDK.getUserInfoWithType(shareType, authOptions: nil) { (result, userinfo: ISSPlatformUser!, error: ICMErrorInfo!) -> Void in
            if result {
                ///获取用户ID
                print(userinfo.uid()!)
            }
            else {
                // code: -6004 代表没有安装QQ
                // code: -22003 代表没有安装微信
                if error.errorCode() == -6004 {
                    print("您没有安装QQ")
                }
                else if error.errorCode() == -22003 {
                    print("您没有安装微信")
                }
                else {
                    print("第三方登录失败")
                }
            }
        }
    }

}

