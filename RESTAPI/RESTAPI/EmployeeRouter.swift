//
//  EmployeeRouter.swift
//  RESTAPI
//
//  Created by Nguyễn Văn Tú on 11/15/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
enum EmployeeRouterEndPoint {
    case getEmployees
    case getEmployeeDetail(id: String)
    case get
}
class EmployeeRouter: BaseRouter {
    var endPoint: EmployeeRouterEndPoint!
    override var path: String {
        switch endPoint {
        case .getEmployees:
            return "v1/employees"
        case .getEmployeeDetail(let id):
            return ""
        default:
            return ""
        }
    }
    override func run(completion: @escaping (Any?, String?) -> Void) {
        self.runAlamofire(completion: completion)
    }
}
