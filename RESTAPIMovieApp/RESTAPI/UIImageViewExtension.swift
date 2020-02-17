//
//  UIImageViewExtension.swift
//  RESTAPI
//
//  Created by Nguyễn Văn Tú on 2/17/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func loadPosterUrl(posterPath: String) {
        if let imageBaseUrl = URL(string: Config.URL.basePoster) {
            let posterPath = imageBaseUrl
                .appendingPathComponent("w300")
                .appendingPathComponent(posterPath)

            kf.indicatorType = .activity
            kf.setImage(
                with: posterPath,
                options: [.transition(.fade(0.2))]
            )
        }
    }
}
