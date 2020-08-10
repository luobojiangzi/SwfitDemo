//
//  MyTableViewCell.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/7.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    override var frame: CGRect {
          get {
              return super.frame
          }
          set {
              var frame = newValue
              frame.origin.x += 15
              frame.size.width -= 2 * 15
              super.frame = frame
          }
      }

}
