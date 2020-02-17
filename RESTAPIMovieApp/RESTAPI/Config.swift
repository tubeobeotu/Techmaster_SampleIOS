//
//  Config.swift
//  TheMovies
//
//  Created by Mikhail Pchelnikov on 09/06/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import Foundation

/// Constants and static data.
struct Config {
    static let apiKey = "43d6fdf2519ac3ec6702d1c5f68d6aed"
    struct URL {
        static let base = "http://api.themoviedb.org/3"
        static let basePoster = "http://image.tmdb.org/t/p"
    }
}

enum MovieActionType {
    case discover(page: Int)
    case detail(id: Int)
    case search(keyword: String, page: Int)
    var path: String {
        switch self {
        case .discover(let page):
            return "\(Config.URL.base)/discover/movie?api_key=\(Config.apiKey)&language=vi-VN&sort_by=popularity.desc&include_adult=true&include_video=true&page=\(page)".percentEncoding ?? ""
        case .detail(let id):
            return "\(Config.URL.base)/movie/\(id)?api_key=\(Config.apiKey)&language=vi-VN".percentEncoding ?? ""
        case .search(let keyword, let page):
            return "\(Config.URL.base)/search/movie?api_key=\(Config.apiKey)&language=vi-VN&query=\(keyword)&page=\(page)&include_adult=true".percentEncoding ?? ""
            
        }
    }
}

extension String {
    var percentEncoding: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
