//
//  MovieLocal.swift
//  RealmSample
//
//  Created by Nguyễn Văn Tú on 2/20/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
import RealmSwift
class MovieLocal: Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var name = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
extension MovieLocal: LocalModelP {
    
}
extension MovieLocal: ParserLocalP {
    func toModel() -> Any {
        let movie = Movie()
        for name in self.allKeys(){
            if(movie.responds(to: Selector(name))){
                movie.setValue(value(forKey: name), forKey: name)
            }
        }
        return movie
    }
}
