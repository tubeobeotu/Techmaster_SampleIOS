//
//  ViewController.swift
//  UINavigationController
//
//  Created by Nguyễn Văn Tú on 1/13/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sreen1"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(action))
    }
    
    @objc func action(sender: UIBarButtonItem) {
        // Function body goes here
        print("Edit")
    }

    @IBAction func push(_ sender: Any) {

    }
    
}

