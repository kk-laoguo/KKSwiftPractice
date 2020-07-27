//
//  API.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/24.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Moya
import HandyJSON
import MBProgressHUD



let networkActivityPlugin = NetworkActivityPlugin { (change, target) in
    
    
    DispatchQueue.main.async {
        guard let vc = topController else { return }
        switch(change) {
        case .ended:
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            MBProgressHUD.hide(for: vc.view, animated: true)
            
        case .began:
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//            MBProgressHUD.hide(for: vc.view, animated: false)
//            MBProgressHUD.showAdded(to: vc.view, animated: true)
        }
    }
    
}

let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<Api>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let ApiProvider = MoyaProvider<Api>(requestClosure: timeoutClosure)
let ApiLoadingProvider = MoyaProvider<Api>(requestClosure: timeoutClosure, plugins: [networkActivityPlugin])

enum Api {
    // 发现首页
    case findHome
    // 漫画介绍
    case comicIntro(comicid: Int)
    // 漫画所有章节
    case comicChapterList(comicid: Int)
    //章节内容
    case chapter(chapter_id: String?)
    // 我的收藏
    case myFav
    // 我的书单
    case myBookList
    // 阅读历史
    case readHistory
    
}

extension Api: TargetType {
    
    static let userKey: String = "自己的账号产生的KEY"

    var baseURL: URL {
        return URL(string: "https://app.u17.com/v3/appV3_3/ios/phone")!
    }
    
    var path: String {
        switch self {
        case .findHome: return "comic/getDetectListV4_5"
        case .comicIntro: return "comic/detail_simple_dynamic"
        case .comicChapterList: return "comic/getDetailChapterList"
        case .chapter: return "comic/chapterNew"
            
        case .myFav: return "fav/index"
        case .myBookList: return "fav/group"
        case .readHistory: return "read/readhistory"
        }
    }
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        var parmeters: [String: Any] = [:]
        switch self {
        case .comicIntro(let comicid):
            parmeters["comicid"] = comicid
            parmeters["version"] = "5.0.3"
        case .comicChapterList(let comicid):
            parmeters["comicid"] = comicid
        case .chapter(let chapter_id):
            parmeters["chapter_id"] = chapter_id
        case .myFav, .myBookList, .readHistory:
            parmeters["key"] = Api.userKey
        case .findHome:
            break
        }
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
        
}

extension Response {
    func mapToModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func request<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable? {
        
        
        request(target) { result in
            guard let completion = completion else { return }
            switch result {
            case let .success(response):
                guard let returnData = try? response.mapToModel(ResponseData<T>.self) else {
                    completion(nil)
                    return
                }
                completion(returnData.data?.returnData)
            case .failure(_):
                completion(nil)
            }
        }
    }
}

struct ReturnData<T: HandyJSON>: HandyJSON {
    var message: String?
    var returnData: T?
    var stateCode: Int = 0
}
struct ResponseData<T: HandyJSON>: HandyJSON {
    var code: Int = 0
    var data: ReturnData<T>?
}
