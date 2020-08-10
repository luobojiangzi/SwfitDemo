////
////  PHMoyaHttp.swift
////  RXSwiftLearn
////
////  Created by 李智慧 on 2020/8/6.
////  Copyright © 2020 李智慧. All rights reserved.
////
//
//import Foundation
//
////  博客地址: https://www.cnblogs.com/phbk/p/8497019.html
//
//import Moya
////import Result
////import ObjectMapper
//import SwiftyJSON
//
/////成功
//typealias SuccessStringClosure = (_ result: String) -> Void
//typealias SuccessModelClosure = (_ result: Mappable?) -> Void
//typealias SuccessArrModelClosure = (_ result: [Mappable]?) -> Void
//typealias SuccessJSONClosure = (_ result:JSON) -> Void
///// 失败
//typealias FailClosure = (_ errorMsg: String?) -> Void
//
///// 网络请求
//public class PHMoyaHttp{
//    /// 共享实例
//    static let shared = PHMoyaHttp()
//    private init(){}
//    private let failInfo="数据解析失败"
//    /// 请求JSON数据
//    func requestDataWithTargetJSON<T:TargetType>(target:T,successClosure:@escaping SuccessJSONClosure,failClosure: @escaping FailClosure) {
//        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
//        let _=requestProvider.request(target) { (result) -> () in
//            switch result{
//            case let .success(response):
//                do {
//                    let mapjson = try response.mapJSON()
//                    let json=JSON(mapjson)
//                    successClosure(json)
//                } catch {
//                    failClosure(self.failInfo)
//                }
//            case let .failure(error):
//                failClosure(error.errorDescription)
//            }
//        }
//    }
//    /// 请求数组对象JSON数据
//    func requestDataWithTargetArrModelJSON<T:TargetType,M:Mappable>(target:T,model:M,successClosure:@escaping SuccessArrModelClosure,failClosure: @escaping FailClosure) {
//        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
//        let _=requestProvider.request(target) { (result) -> () in
//            switch result{
//            case let .success(response):
//                do {
//                    let json = try response.mapJSON()
//                    let arr=Mapper<M>().mapArray(JSONObject:JSON(json).object)
//                    successClosure(arr)
//                } catch {
//                    failClosure(self.failInfo)
//                }
//            case let .failure(error):
//                failClosure(error.errorDescription)
//            }
//        }
//    }
//    /// 请求对象JSON数据
//    func requestDataWithTargetModelJSON<T:TargetType,M:Mappable>(target:T,model:M,successClosure:@escaping SuccessModelClosure,failClosure: @escaping FailClosure) {
//        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
//        let _=requestProvider.request(target) { (result) -> () in
//            switch result{
//            case let .success(response):
//                do {
//                    let json = try response.mapJSON()
//                    let model=Mapper<M>().map(JSONObject:JSON(json).object)
//                    successClosure(model)
//                } catch {
//                    failClosure(self.failInfo)
//                }
//            case let .failure(error):
//                failClosure(error.errorDescription)
//            }
//        }
//    }
//    ///请求String数据
//    func requestDataWithTargetString<T:TargetType>(target:T,successClosure:@escaping SuccessStringClosure,failClosure: @escaping FailClosure) {
//        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
//        let _=requestProvider.request(target) { (result) -> () in
//            switch result{
//            case let .success(response):
//                do {
//                    let str = try response.mapString()
//                    successClosure(str)
//                } catch {
//                    failClosure(self.failInfo)
//                }
//            case let .failure(error):
//                failClosure(error.errorDescription)
//            }
//
//        }
//    }//设置一个公共请求超时时间
//    private func requestTimeoutClosure<T:TargetType>(target:T) -> MoyaProvider<T>.RequestClosure{
//        let requestTimeoutClosure = { (endpoint:Endpoint<T>, done: @escaping MoyaProvider<T>.RequestResultClosure) in
//            do{
//                var request = try endpoint.urlRequest()
//                request.timeoutInterval = 20 //设置请求超时时间
//                done(.success(request))
//            }catch{
//               return
//            }
//        }
//        return requestTimeoutClosure
//    }
//
//}
