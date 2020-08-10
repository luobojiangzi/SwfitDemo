//
//  HttpRequest.swift
//  RXSwiftLearn
//
//  Created by 李智慧 on 2020/8/6.
//  Copyright © 2020 李智慧. All rights reserved.
//

import Foundation
import Moya

enum HttpRequest {
     case shujuList(parameter:Dictionary<String, Any>) //带一堆参数的
     case othetRequest(str:String) //带一个参数的请求
     case requestCityList //不带参数的请求
    case news(_ offset: String)
}


/*
 遵循mayo协议，实现方法
 */
extension HttpRequest : TargetType{
    
    //服务器地址
    var baseURL: URL {
        return URL(string: "https://c.m.163.com")!
    }
    
    //各个请求的具体路径
    var path: String {
        switch self {
        case .shujuList:
            return "/ArticleList"
        case .othetRequest:
            return "/someOtherPath"
        case .news:
                return "/dlist/article/dynamic"
        default:
            return "/requestCityList"
        }
    }
    
    //请求方式
    var method: Moya.Method {
        switch self {
        case .shujuList:
            return .post
        case .news:
            return .get
        default:
            return .get
        }
    }
    
    //请求任务事件（这里附带上参数）
    var task: Task {
        var param:[String:Any] = [:]
        
        switch self {
        case let .shujuList(parameter):
            param = parameter
        case let .othetRequest(str):
            param["str"] = str
        case let .news(offset):
            param = ["from": "T1348649079062", "devId": "H71eTNJGhoHeNbKnjt0%2FX2k6hFppOjLRQVQYN2Jjzkk3BZuTjJ4PDLtGGUMSK%2B55", "version": "54.6", "spever": "false", "net": "wifi", "ts": "\(Date().timeStamp)", "sign": "BWGagUrUhlZUMPTqLxc2PSPJUoVaDp7JSdYzqUAy9WZ48ErR02zJ6%2FKXOnxX046I", "encryption": "1", "canal": "appstore", "offset": offset, "size": "10", "fn": "3"]
        default:
            //不需要传参数的走这里
            return .requestPlain
        }
        return .requestParameters(parameters: param, encoding: URLEncoding.default)
    }
    
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
//        return "{}".data(using: String.Encoding.utf8)!
        return Data()
    }
    
    //设置请求头
    public var headers: [String: String]? {
        return nil
                      
//        return ["Accept":"application/json","Content-Type":"application/json; charset=utf-8","x-client-system":"ios","x-client-systemVersion":UIDevice.current.systemVersion,"x-client-appVersion":app_version]
        
    }
    
}


