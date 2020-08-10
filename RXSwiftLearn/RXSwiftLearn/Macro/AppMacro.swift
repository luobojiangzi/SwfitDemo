//
//  AppMacro.swift
//  GameE
//
//  Created by 李智慧 on 2020/8/4.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit

//是否带bar
let SD_IS_PHONERX = (Double(UIScreen.main.bounds.size.height) >= 812.0 ? true : false)

// 屏幕的宽
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

// 屏幕的高
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//状态栏高度
//let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height
// 状态栏高度
let SD_STATUSBAR_HEIGHT = (SD_IS_PHONERX ? 44.0 : 20.0)

//导航栏高度:通用
//let NAVIGATIONBAR_HEIGHT = UINavigationController().navigationBar.frame.size.height
//导航栏高度
let SD_NAVIGATIONBAR_HEIGHT = 44.0

// 导航+状态栏高度
let SD_MAX_NAVIGATIONBAR_HEIGHT = SD_NAVIGATIONBAR_HEIGHT + SD_STATUSBAR_HEIGHT

// 安全高度
let SD_SAFE_HEIGHT = (SD_IS_PHONERX ? 34.0 : 0.0)

// 标签栏高度
let SD_TABBAR_HEIGHT = (SD_IS_PHONERX ? 83.0 : 49.0)


//判断是否iphoneX
//let W_IPHONEX = (Double(SCREEN_WIDTH) == Double(375.0) && Double(SCREEN_HEIGHT) == Double(812.0)) ? true : false
//let W_NAVBARHEIGHT = W_IPHONEX ? Double(88.0) : Double(64.0)
//let W_TABBARHEIGHT = W_IPHONEX ? Double(49.0+34.0) : Double(49.0)
//let W_STATUSBARHEIGHT = W_IPHONEX ? Double(44.0) : Double(20.0)

func KRGBColor(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
}
//字体大小
//var KFont: (CGFloat) -> UIFont = {size in
//    UIFont.systemFont(ofSize: size)
//}

func KFont(size:CGFloat) -> UIFont {
    UIFont.systemFont(ofSize: size)
}

func KDINBold(size:CGFloat) -> UIFont {
    UIFont(name: "DINAlternate-Bold", size: size)!
}

func KPFMedium(size:CGFloat) -> UIFont {
    UIFont(name: "PingFangSC-Medium", size: size)!
}

func KPFRegular(size:CGFloat) -> UIFont {
    UIFont(name: "PingFangSC-Regular", size: size)!
}

func KPFSemibold(size:CGFloat) -> UIFont {
    UIFont(name: "PingFangSC-Semibold", size: size)!
}

