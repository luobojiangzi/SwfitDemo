//
//  BaseTabbarController.swift
//  GameE
//
//  Created by 李智慧 on 2020/8/4.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit


class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.addChildViewController(childController: HomeVC(), imageNameStr: "game", title: "游戏")
        
        self.addChildViewController(childController: VipVC(), imageNameStr: "vip", title: "会员")
        
        self.addChildViewController(childController: MyVC(), imageNameStr: "my", title: "我的")
        
    }
    
    
    func addChildViewController(childController:UIViewController,imageNameStr:String,title:String) -> Void {
        
        let navBar = BaseNavBarController.init(rootViewController:childController)
        navBar.tabBarItem.title = title
        navBar.tabBarItem.image = UIImage.init(named: "tab_"+imageNameStr+"_nor")
        navBar.tabBarItem.selectedImage = UIImage.init(named: "tab_"+imageNameStr+"_sel")
        self.addChild(navBar)
        navBar.tabBarController?.tabBar.backgroundColor = UIColor.white
        
    }


}
