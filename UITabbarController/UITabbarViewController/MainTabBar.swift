//
//  MainTabBar.swift
//  UITabbarViewController
//
//  Created by Nguyễn Văn Tú on 1/13/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
//        self.tabBar.items
    }
    

}

extension MainTabBar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(viewController)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
