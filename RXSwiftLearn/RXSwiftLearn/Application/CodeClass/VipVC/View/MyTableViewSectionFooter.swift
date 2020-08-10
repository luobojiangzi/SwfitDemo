//
//  MyTableViewSectionFooter.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/7.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit

class MyTableViewSectionFooter: UIView {

    //标题文本标签
    var titleLabel:UILabel!
     
    //圆角半径
    let cornerRadius:CGFloat = 15.0
     
    //实现圆角的遮罩层
    var shapeLayer:CAShapeLayer!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        //设置背景色
        self.backgroundColor = UIColor.darkGray
         
        //设置文本标签
        titleLabel = UILabel()
        titleLabel.text = "self.adHeaders?[section]"
        titleLabel.textColor = UIColor.white
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: self.frame.width/2, y: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(titleLabel)
         
        //设置圆角遮罩
        shapeLayer = CAShapeLayer()
        self.layer.mask = shapeLayer
    }
     
    //覆盖frame，自动添加边距
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var frame = newValue
            frame.origin.x += 15
            frame.size.width -= 2 * 15
            frame.size.height -= 10
            super.frame = frame
        }
    }
     
    //子视图布局
    override func layoutSubviews() {
        super.layoutSubviews()
         
        //调整文字标签位置
        self.titleLabel.frame = CGRect(x: 10, y:0, width:self.frame.width-10,
                                       height:self.frame.height)
         
        //调整遮罩层路径
        let bezierPath = UIBezierPath(roundedRect: bounds,
                                      byRoundingCorners: [.bottomLeft,.bottomRight],
                                      cornerRadii: CGSize(width: cornerRadius,
                                                          height: cornerRadius))
        shapeLayer.path = bezierPath.cgPath
    }
     
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
