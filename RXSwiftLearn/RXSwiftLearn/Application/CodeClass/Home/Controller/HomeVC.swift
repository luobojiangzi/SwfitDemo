//
//  HomeVC.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/6.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit

struct UserInfo {
    var name:String?
    var phone:String?
}

class HomeVC: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var userList = [UserInfo]()
        userList.append(UserInfo(name: "张三", phone: "4234"))
        userList.append(UserInfo(name: "李四", phone: "1212"))
        userList.append(UserInfo(name: "航歌", phone: "3525"))

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "列表", style: .plain, target: self, action: #selector(listVC))
        
        let btn1:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 32))
        btn1.center = CGPoint(x: view.frame.size.width/2, y: 160)
        btn1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)//文字大小
        btn1.setTitleColor(.orange, for: .normal) //文字颜色
        btn1.set(image: UIImage(named: "aliPay"), title: "文字在左侧", titlePosition: .left,
                 additionalSpacing: 10.0, state: .normal)
        view.addSubview(btn1)
        
        let btn2:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 32))
        btn2.center = CGPoint(x: view.frame.size.width/2, y: 220)
        btn2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28) //文字大小
        btn2.setTitleColor(.orange, for: .normal)//文字颜色
        btn2.set(image: UIImage(named: "aliPay"), title: "文字在右侧", titlePosition: .right, additionalSpacing: 10.0, state: .normal)
        view.addSubview(btn2)
        
        let btn3:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 70))
        btn3.center = CGPoint(x: view.frame.size.width/2, y: 330)
        btn3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28) //文字大小
        btn3.setTitleColor(.orange, for: .normal) //文字颜色
        btn3.set(image: UIImage(named: "aliPay"), title: "文字在上方", titlePosition: .top,
                 additionalSpacing: 10.0, state: .normal)
        view.addSubview(btn3)
        
        let btn4:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 70))
        btn4.center = CGPoint(x: view.frame.size.width/2, y: 390)
        btn4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28) //文字大小
        btn4.setTitleColor(.orange, for: .normal) //文字颜色
        btn4.set(image: UIImage(named: "aliPay"), title: "文字在下方", titlePosition: .bottom,
                 additionalSpacing: 10.0, state: .normal)
        view.addSubview(btn4)
        
        //左右14像素不变形，中间缩放
        let imgTrackRight = UIImage(named:"aliPay")
        let imgRight = imgTrackRight?.stretchableImage(withLeftCapWidth: 14, topCapHeight: 10)
        
        let imageView = UIImageView(image: imgRight)
        imageView.frame = CGRect(x: 0, y: 420, width: 248, height: 148)
        view.addSubview(imageView)
        
        
    }

    @objc func listVC (){
        
        navigationController?.pushViewController(MyVC(), animated: true)
        
    }
  
    
}
