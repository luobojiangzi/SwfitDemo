//
//  HeaderAndFooterVC.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/7.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit
/*
 文章地址:
 https://www.hangge.com/blog/cache/detail_2195.html

 */

protocol EditViewControllerDelegate{
    func editInfo(newInfo:String)
}

class HeaderAndFooterVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
     
    var tableView:UITableView?
     
    var allnames:Dictionary<Int, [String]>?
     
    var delegate:EditViewControllerDelegate?
    
    override func loadView() {
        super.loadView()
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        //初始化数据
        self.allnames =  [
            0:[String]([
                "UILabel 标签",
                "UITextField 文本框"]),
            1:[String]([
                "UIDatePiker 日期选择器",
                "UIToolbar 工具条",
                "UIToolbar 工具条"]),
            2:[String]([
                "UIProgressView 进度条"])
        ]
         
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
    }
     
    //返回分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allnames!.count
    }
     
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames?[section]
        return data!.count
    }
     
    //返回分区头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)
        -> UIView? {
        let headerView = MyTableViewSectionHeader()
        headerView.titleLabel.text = "分组\(section)"
        return headerView
    }
     
    //返回分区头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)
        -> CGFloat {
        return 40
    }
     
    //返回分区尾部视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int)
        -> UIView? {
        let data = self.allnames?[section]
        let footerView = MyTableViewSectionFooter()
        footerView.titleLabel.text = "有\(data!.count)个控件"
        return footerView
    }
     
    //返回分区尾部高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int)
        -> CGFloat {
        return 40
    }
     
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //获取单元格
            let cell = self.tableView?.dequeueReusableCell(withIdentifier: "cell")
                as! MyTableViewCell
            cell.accessoryType = .disclosureIndicator
             
            //设置单元格内容
            let secno = indexPath.section
            var data = self.allnames?[secno]
            cell.textLabel?.text = data![indexPath.row]
             
            return cell
    }
}
