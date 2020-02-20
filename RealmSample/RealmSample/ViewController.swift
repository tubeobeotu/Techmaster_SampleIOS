//
//  ViewController.swift
//  RealmSample
//
//  Created by Nguyễn Văn Tú on 2/20/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addMovie()
        getMovie()
    }
    
    func addMovie() {
        let movie = Movie()
        movie.name = "Gái già lắm chiêu"
        movie.id = 0
        DBManager.sharedInstance.addModel(model: movie.toModel())
        getMovie()
    }
    
    func getMovie() {
        let predicate = NSPredicate(format: "id = %d", 0)
        let sorted = Sorted.init(key: "name", ascending: true)
        DBManager.sharedInstance.fetch(MovieLocal.self, Movie.self, predicate: predicate, sorted: sorted) { (rawValues, movies) in
            print("")
        }
    }
    
    func delete() {
        let predicate = NSPredicate(format: "id = %d", 0)
//        let sorted = Sorted.init(key: "name", ascending: true)
        DBManager.sharedInstance.fetch(MovieLocal.self, Movie.self, predicate: predicate, sorted: nil) { (rawValues, movies) in
            if let movieLocal = rawValues.first {
                DBManager.sharedInstance.deleteModel(model: movieLocal)
            }
        }
    }


}

