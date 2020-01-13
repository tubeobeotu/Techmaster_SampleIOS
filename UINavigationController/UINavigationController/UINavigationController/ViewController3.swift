//
//  ViewController3.swift
//  UINavigationController
//
//  Created by Nguyễn Văn Tú on 1/13/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func push(_ sender: Any) {
    }
    @IBAction func pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
    }
    @IBAction func popToRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
