//
//  VipVC.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/7.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit

class VipVC: UIViewController , UITableViewDelegate, UITableViewDataSource, EditViewControllerDelegate{
   
    var tableView:UITableView?
    
    var allnames:Dictionary<Int, [String]>?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据
        self.allnames =  [
            0:[String]([
                "UILabel 标签",
                "UITextField 文本框",
                "UIButton 按钮"]),
            1:[String]([
                "UIDatePiker 日期选择器",
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "section分组圆角效果（含有分区头、尾）", style: UIBarButtonItem.Style.plain, target: self, action: #selector(haveHeaderAndFooter))
        
    }
    
    @objc func haveHeaderAndFooter() {
        let headerVC = HeaderAndFooterVC()
        headerVC.delegate = self
        navigationController?.pushViewController(headerVC, animated: true)
        
    }
    
    
    func editInfo(newInfo: String) {
        
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
            
            //圆角半径
            let cornerRadius:CGFloat = 15.0
            
            //下面为设置圆角操作（通过遮罩实现）
            let sectionCount = tableView.numberOfRows(inSection: indexPath.section)
            let shapeLayer = CAShapeLayer()
            cell.layer.mask = nil
            var bounds = cell.bounds
            let KScreenWidth = UIScreen.main.bounds.size.width
            //当前分区有多行数据时
            if sectionCount > 1 {
                switch indexPath.row {
                //如果是第一行,左上、右上角为圆角
                case 0:
                    bounds.origin.y += 1.0  //这样每一组首行顶部分割线不显示
                    let rect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: KScreenWidth-2*cornerRadius, height: bounds.size.height)
                    let bezierPath = UIBezierPath(roundedRect: rect,
                                                  byRoundingCorners: [.topLeft,.topRight],
                                                  cornerRadii: CGSize(width: cornerRadius,height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                //如果是最后一行,左下、右下角为圆角
                case sectionCount - 1:
                    var bounds = cell.bounds
                    bounds.size.height -= 1.0  //这样每一组尾行底部分割线不显示
                    let rect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: KScreenWidth-2*cornerRadius, height: bounds.size.height)
                    let bezierPath = UIBezierPath(roundedRect: rect,
                                                  byRoundingCorners: [.bottomLeft,.bottomRight],
                                                  cornerRadii: CGSize(width: cornerRadius,height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                default:
                    break
                }
            }
                //当前分区只有一行行数据时
            else {
                //四个角都为圆角（同样设置偏移隐藏首、尾分隔线）
                let rect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: KScreenWidth-2*cornerRadius, height: bounds.size.height)
                
                let bezierPath = UIBezierPath(roundedRect:
                    rect.insetBy(dx: 0.0, dy: 2.0),
                                              cornerRadius: cornerRadius)
                shapeLayer.path = bezierPath.cgPath
                cell.layer.mask = shapeLayer
            }
            
            return cell
    }
}
