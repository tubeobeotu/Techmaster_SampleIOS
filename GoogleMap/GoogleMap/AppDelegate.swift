//
//  AppDelegate.swift
//  GoogleMap
//
//  Created by Nguyễn Văn Tú on 11/23/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let googleAPIKey = "AIzaSyALdLwaRxGHH43JV6-miZt_Jp-B2LDgV0U"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupGoogleMap()
        return true
    }
    
    func setupGoogleMap() {
        GMSServices.provideAPIKey(googleAPIKey)
        GMSPlacesClient.provideAPIKey(googleAPIKey)
    }
}

