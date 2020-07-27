//
//  APIServer.swift
//  ZXCARMANAGER
//
//  Created by Yuns on 2018/3/8.
//  Copyright © 2018年 ZXEVPOP. All rights reserved.
//

import Foundation
import Moya




#if DEBUG
public let APIServer = MoyaProvider<APIManager>(plugins: [NetworkLoggerPlugin(verbose: true)])
#else
public let APIServer = MoyaProvider<APIManager>()
#endif

public enum APIManager {
    case loadConfig(APIConfig)
    case uploadConfig(APIUploadConfig)
}

extension APIManager: TargetType {
    
    public var baseURL: URL {
        switch self {
        case .loadConfig(let config):
            return config.APIBaseURL()
        case .uploadConfig(let config):
            return config.APIBaseURL()
        }
    }
    
    public var path: String {
        switch self {
        case .loadConfig(let config):
            return config.requestPath
        case .uploadConfig(let config):
            return config.requestPath
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .loadConfig(let config):
            switch config.requestMethod {
            case .post:
                return .post
            default:
                return .get
            }
        case .uploadConfig(_):
            return .post
        }
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .loadConfig(let config):
            if let params = config.requestParams {
             /**
                1、JSONEncoding.default 是放在HttpBody内的，   比如post请求
                2、URLEncoding.default 在GET中是拼接地址的，    比如get请求
                3、URLEncoding(destination: .methodDependent) 是自定义的URLEncoding，methodDependent的值如果是在GET 、HEAD 、DELETE中就是拼接地址的。其他方法方式是放在httpBody内的。
                4、URLEncoding(destination: .httpbody)是放在httpbody内的
                
                作者：LiuPN
                链接：https://www.jianshu.com/p/1c56a158157c
                來源：简书
                简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
                */
 
                if config.requestEncodingType == .URL {
                    return .requestParameters(parameters: params, encoding: URLEncoding.default)
                }
                return .requestParameters(parameters: params, encoding: JSONEncoding.default)
            }
        case .uploadConfig(let config):
            // 提交批量文件到服务器：参数+数据+文件
            return uploadTask(config: config)
        }
        return .requestPlain
    }
    
    public var headers: [String: String]? {
        switch self {
        case .loadConfig(let config):
            return config.requestHeaders
        case .uploadConfig(let config):
            return config.requestHeaders
        }
    }
}

// MARK: - Task
extension APIManager {
    func uploadTask(config: APIUploadConfig) -> Task {
        // 提交批量文件到服务器：参数+数据+文件
        var formDataContainer = [MultipartFormData]()
        // 参数
        if let params = config.requestParams as? [String: String] {
            for (k, v) in params {
                if let strData = v.data(using: .utf8) {
                    let formData = MultipartFormData(provider: .data(strData), name: k)
                    formDataContainer.append(formData)
                }
            }
        }
        
        // 数据
        if let datas = config.datas {
            for data in datas {
                let formData = MultipartFormData(provider: .data(data.uploadData), name: data.dataName, fileName: data.fileName, mimeType: data.mineType)
                formDataContainer.append(formData)
            }
        }
        
        // 文件
        if let files = config.files {
            for file in files {
                let formData = MultipartFormData(provider: .file(file.uploadFile), name: file.dataName, fileName: file.fileName, mimeType: file.mineType)
                formDataContainer.append(formData)
            }
        }
        // 提交
        return .uploadMultipart(formDataContainer)
    }
}
