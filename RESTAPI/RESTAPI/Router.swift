//
//  Router.swift
//  RESTAPI
//
//  Created by Nguyễn Văn Tú on 11/15/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ServerConfig {
    case Product
    case Staging
    case Dev
    
    var urlString:String {
        get {
            switch self {
            case .Product:
                return "http://dummy.restapiexample.com/api/"
            default:
                return "aaaabbb"
            }
        }
    }
    var port:String {
        get {
            switch self {
            case .Product:
                return "8080"
            default:
                return "10L:22"
            }
        }
    }
}

enum APIHTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

class BaseRouter: NSObject {
    var serverConfig = ServerConfig.Product
    var method: APIHTTPMethod {
        return .get
    }
    var endpointString: String {
        fatalError("[\(#function))] Must be overridden in subclass")
    }
    var params: [String: Any]? {
        return nil
    }
 
    
    func run(completion: @escaping (_ json: Any?, _ error: String?) -> Void) {

        let url = String(format: serverConfig.urlString + endpointString)
        guard let serviceUrl = URL(string: url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = method.rawValue
        if method == .put || method == .post {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        if let parameterDictionary = params {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: [.fragmentsAllowed]) else {
                return
            }
            request.httpBody = httpBody
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(json, nil)
                } catch {
                    completion(nil, data.toString() ?? "")
                }
            }
        }.resume()
    }
    
    func runAlamofire(completion: @escaping (_ json: Any?, _ error: String?) -> Void) {
        let url = String(format: serverConfig.urlString + endpointString)
        guard let serviceUrl = URL(string: url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = method.rawValue
        if method == .put || method == .post {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        }
        if let parameterDictionary = params {
            var rawText = ""
            if let theJSONData = try? JSONSerialization.data(
                withJSONObject: parameterDictionary,
                options: []) {
                let theJSONText = String(data: theJSONData,
                                         encoding: .utf8)
                rawText = theJSONText ?? ""
                print("JSON string = \(theJSONText!)")
            }
            if let textData = rawText.data(using: .utf8, allowLossyConversion: false) {
                request.httpBody = textData
            }
        }

        SessionManager.default.request(request).responseJSON(completionHandler: { data in
            
            switch data.result {
            case .success(let data):
                completion(data, nil)
                break
            case .failure(let error):
                completion(nil, error.localizedDescription)
                break
            }
        })
    }
}
