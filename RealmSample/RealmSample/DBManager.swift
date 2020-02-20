//
//  DBManager.swift
//  Realm
//
//  Created by Nguyễn Văn Tú on 2/20/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
import RealmSwift
public protocol ParserLocalP {
    func toModel() -> Any
}
public protocol LocalModelP {
    
}
struct Sorted {
    var key: String
    var ascending: Bool = true
}
class DBManager: NSObject {
    let realm = try! Realm()
    static let sharedInstance : DBManager = {
        let instance = DBManager()
        return instance
    }()
    func addModel(model: Any) {
        if let model = model as? Object {
            try! realm.write {
                realm.add(model, update: .all)
            }
        }
    }

    func deleteModel(model: Any){
        if let model = model as? Object {
            try! realm.write {
                realm.delete(model)
            }
        }
    }

    func deleteAll<T : Object>(_ model: T.Type) throws {
        let objects = realm.objects(model as Object.Type)
        
        for object in objects {
            try! realm.write {
                realm.delete(object)
            }
        }
    }

    func reset() throws {
        try! realm.write {
            realm.deleteAll()
        }
    }

    func fetch<T: LocalModelP, K: ParserLocalP>(_ model: T.Type, _ castingModel: K.Type, predicate: NSPredicate?, sorted: Sorted?, completion: ((_ rawObjects:Results<Object>, [K]) -> ())){
        var objects = self.realm.objects(model as! Object.Type)
        
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        
        if let sorted = sorted {
            objects = objects.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
        }
        
        var accumulate: [K] = [K]()
        for object in objects {
            if let tmpObjc = object as? ParserLocalP{
                accumulate.append(tmpObjc.toModel() as! K)
            }
            
        }
        completion(objects, accumulate)
    }
}

