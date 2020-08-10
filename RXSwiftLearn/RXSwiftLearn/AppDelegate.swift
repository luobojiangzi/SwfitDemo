//
//  AppDelegate.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/6.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit

import Hue
import SnapKit
import Kingfisher
import Alamofire
import Moya
import SwiftyJSON
import KakaJSON
import IQKeyboardManagerSwift

import RxSwift
import RxCocoa
import RxDataSources

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initRootVC()
        setAppreance()
        IQKeyboard()
        kakaJosnSetting()
        
        return true
    }
    
    
    func initRootVC() {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = BaseTabbarController()
        window?.makeKeyAndVisible()
        
        
        
    }
    
    func setAppreance() {
        //修改一 渲染色 -- 建议在程序刚启动的时候就修改
        UINavigationBar.appearance().tintColor = UIColor.white//设置两侧按钮的颜色
        UINavigationBar.appearance().barTintColor = UIColor.black//背景色
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor:UIColor.white]//设置标题颜色
        //        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()//去掉navBar线
        UITabBar.appearance().barTintColor = UIColor.white//背景色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .selected)
        UITabBar.appearance().isTranslucent = false
    }
    
    func IQKeyboard() {
        //UITextField 键盘适应
        let manager = IQKeyboardManager.shared// 获取类库的单例变量
        manager.enable = true // 控制整个功能是否启用
        manager.shouldResignOnTouchOutside = true// 控制点击背景是否收起键盘
        manager.shouldToolbarUsesTextFieldTintColor = true// 控制键盘上的工具条文字颜色是否用户自定义
        //配合使用
        //    manager.overrideKeyboardAppearance = YES;
        //    manager.keyboardAppearance = UIKeyboardAppearanceDark;
        manager.shouldToolbarUsesTextFieldTintColor = true// 控制键盘上的工具条文字颜色是否用户自定义
        manager.toolbarManageBehaviour = IQAutoToolbarManageBehaviour.bySubviews// 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
        manager.enableAutoToolbar = true// 控制是否显示键盘上的工具条
        manager.shouldShowToolbarPlaceholder = true // 是否显示占位文字
        manager.placeholderFont = UIFont.boldSystemFont(ofSize: 17)  // 设置占位文字的字体
        manager.keyboardDistanceFromTextField = 10.0 // 输入框距离键盘的距离
        //    如果当某一个输入框特定不需要键盘上的工具条时 (有多个输入框)
        //    textField.inputAccessoryView = [[UIView alloc] init];
    }
    
    func kakaJosnSetting() {
        
        // Set global config once, effect on any type
        //        ConvertibleConfig.setModelKey { property in
        //            property.name.kj.underlineCased()
        //        }
        //        // Config of Person
        //        ConvertibleConfig.setModelKey(for: Person2.self) { property in
        //            // `name` -> `_name_`
        //            property.name == "name" ? "_name_" : property.name
        //        }
        
    }
    
    //当应用进入后台时其作用
    func applicationDidEnterBackground(_ application: UIApplication) {
        saveData()
    }
    
    //当应用终止的时候起作用
    func applicationWillTerminate(_ application: UIApplication) {
        saveData()
    }
    
    func saveData(){
        //获取导航控制器
//        let navigation = self.window?.rootViewController as UINavigationController
//        //获取导航控制器的根视图控制器
//        var controller:ViewController = navigation.viewControllers.first! as ViewController
//        //执行ViewController的自定义数据保存方法
//        controller.saveData()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
}

