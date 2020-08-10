//
//  MyModel.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/6.
//  Copyright © 2020 李智慧. All rights reserved.
//

import Foundation
import KakaJSON
//
//struct MyModel: Convertible {
//    var name: String?
//    var imgsrc: String?
//    var age: Int?
//}
//

//struct NewsSections: Convertible{
//    var header: String  = "1"
//    var items: [NewsModel]?
//}

struct NewsModel: Convertible{
    var title: String = ""
    var imgsrc: String  = ""
    var replyCount: String  = ""
    var source: String  = ""
    var imgnewextra: [Imgnewextra]?
}

struct Imgnewextra: Convertible{
    var imgsrc: String  = ""
}
