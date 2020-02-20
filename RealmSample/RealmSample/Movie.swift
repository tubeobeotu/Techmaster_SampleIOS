//
//  Movie.swift
//  RealmSample
//
//  Created by Nguyễn Văn Tú on 2/20/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
class Movie: BaseModel {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
}

extension Movie: ParserLocalP {
    func toModel() -> Any {
        let movieLocal = MovieLocal()
        for name in self.allKeys(){
            if(movieLocal.responds(to: Selector(name))){
                movieLocal.setValue(value(forKey: name), forKey: name)
            }
        }
        return movieLocal
    }
}
