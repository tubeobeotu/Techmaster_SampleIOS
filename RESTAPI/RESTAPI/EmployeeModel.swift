//
//  EmployeeModel.swift
//  RESTAPI
//
//  Created by Nguyễn Văn Tú on 11/15/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
class EmployeeModel: NSObject {
    var name = ""
    var age = 0
    var salary = 0
    
    init(json: Any) {
        if let json = json as? Dictionary<String, Any> {
            //swifty json
            self.name = (json["employee_name"] as? String) ?? ""
        }
    }
    
    static func initModels(json: Any) -> [EmployeeModel]? {
        if let json = json as? Array<Dictionary<String, Any>> {
            var models = [EmployeeModel]()
            for jsonModel in json {
                let employee = EmployeeModel.init(json: jsonModel)
                models.append(employee)
            }
            return models
            
//            self.name = ((json[0]["info"] as? [String: Any])?["name"] as? String) ?? ""
            
            //SwiftyJson
//            let jsonModel = JSON(json)
//            let employName = jsonModel[0]["info"]["name"].stringValue
//            self.name = employName
//            print(json)
        }
        return nil
    }
}
