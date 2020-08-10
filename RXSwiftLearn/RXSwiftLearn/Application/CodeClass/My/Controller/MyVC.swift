//
//  MyVC.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/6.
//  Copyright © 2020 李智慧. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import KakaJSON

//import Result

//import ObjectMapper

class MyVC: UIViewController ,UITableViewDataSource {
    
    private var myRefreshView: MJRefreshComponent?
    private var pageSize = 10
    private var pageNo = 1
    private var dataArr = [Any]()
    
    override func viewDidLoad() {

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets.zero)
        }

        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            [unowned self] in
            self.tableView.mj_footer?.resetNoMoreData()
            self.myRefreshView = self.tableView.mj_header
            self.pageNo = 1
            self.jsonData()
        })
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            [unowned self] in
            self.myRefreshView = self.tableView.mj_footer
            self.pageNo += 1
            self.jsonData()
        })
        tableView.mj_footer?.isHidden = true
        tableView.mj_header?.beginRefreshing()
     
    }
    
    private func jsonData(){

//        let parameters = [
//            "pageNo":self.pageNo,
//            "pageSize":self.pageSize,
//        ]
//        kMBShowMessage(@"", self.view)
        
        let provide = MoyaProvider<HttpRequest>()
        provide.request(.news("0")) { response in
//            kMBHideMessage(self.view)
            switch response {
            case let .success(results):
                self.myRefreshView?.endRefreshing()
//                JSON(results.data).dictionaryObject
                let tempArr = JSON(results.data).dictionaryObject?["T1348649079062"] as? Array<Any>
                
                let modelArr = modelArray(from: tempArr!, NewsModel.self)
//                modelArray(from: arr, NewsSections.self)
                
                if self.myRefreshView == self.tableView.mj_header {
                    self.dataArr = modelArr
                    self.tableView.mj_footer?.isHidden = self.dataArr.count==0
                } else if self.myRefreshView == self.tableView.mj_footer {
                    self.dataArr = self.dataArr + modelArr
                }
                if modelArr.count<self.pageSize {
                    DispatchQueue.main.async {
                        self.tableView.mj_footer?.endRefreshingWithNoMoreData()
                    }
                }
                self.tableView.reloadData()
            case let .failure(error):
                print(error)
//                kMBHideMessage(self.view)
//                kMBShowErro(errorMsg, self.view)
                self.myRefreshView?.endRefreshing()
            }
        }
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        dataArr.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let newsModel = dataArr[indexPath.row] as? NewsModel
        if newsModel?.imgnewextra?.isEmpty ?? true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OneImageNewsTableViewCell") else {
                return UITableViewCell()
            }
            let oneImageCell =  cell as! OneImageNewsTableViewCell
            oneImageCell.setup(newsModel!)
            return oneImageCell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeImagesTableViewCell") else {
                return UITableViewCell()
            }
            let threeeImagesCell =  cell as! ThreeImagesTableViewCell
            threeeImagesCell.setup(newsModel!)
            return threeeImagesCell
        }
        
    }
    
    //设置cell的显示动画
//    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!,
//        forRowAtIndexPath indexPath: NSIndexPath!){
//        //设置cell的显示动画为3D缩放
//        //xy方向缩放的初始值为0.1
//        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
//        //设置动画时间为0.25秒，xy方向缩放的最终值为1
//        UIView.animate(withDuration: 0.25, animations: {
//            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
//        })
//    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OneImageNewsTableViewCell.self, forCellReuseIdentifier: "OneImageNewsTableViewCell")
        tableView.register(ThreeImagesTableViewCell.self, forCellReuseIdentifier: "ThreeImagesTableViewCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.scrollIndicatorInsets = tableView.contentInset
        //        CGFloat.greatestFiniteMagnitude   最大的
        //        CGFloat.leastNormalMagnitude   最小的
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    deinit {
        print("MyVC 释放了")
    }
    
}

extension MyVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let newsModel = dataArr[indexPath.row] as? NewsModel
        if newsModel?.imgnewextra?.isEmpty ?? true {
            return 100.0
        }
        return 180.0
    }
}
