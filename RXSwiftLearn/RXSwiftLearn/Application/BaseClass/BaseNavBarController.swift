//
//  BaseNavBarController.swift
//  GameE
//
//  Created by 李智慧 on 2020/8/4.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit

class BaseNavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func back() {
        self.popViewController(animated: true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true;
            
            let backItem = UIBarButtonItem(image: UIImage(named:"nav_back"), style: .plain, target: viewController.responds(to: #selector(back)) ? viewController : self, action: #selector(back));
            viewController.navigationItem.leftBarButtonItem = backItem;
            
        }
        super.pushViewController(viewController, animated: animated);
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        return super.popViewController(animated: animated);
    }

}
