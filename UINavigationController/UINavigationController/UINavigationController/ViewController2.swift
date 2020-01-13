//
//  ViewController2.swift
//  UINavigationController
//
//  Created by Nguyễn Văn Tú on 1/13/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func push(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
