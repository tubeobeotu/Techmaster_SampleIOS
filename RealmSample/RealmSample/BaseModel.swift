//
//  BaseModel.swift
//  RealmSample
//
//  Created by Nguyễn Văn Tú on 2/20/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
class BaseModel: NSObject {
    
}
extension NSObject{
    func allKeys() -> [String]{
        let names = Mirror(reflecting: self).children.compactMap { $0.label }
        return names
    }
}
