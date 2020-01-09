//
//  ViewController.swift
//  Autolayout
//
//  Created by Nguyễn Văn Tú on 1/6/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl_Content: UILabel!
    @IBOutlet weak var img_Avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.img_Avatar.layer.cornerRadius = 21
        let cstLeft = self.view.constraints.filter { $0.identifier == "cstLeft" }.first
        
        cstLeft?.constant = 30

        // Do any additional setup after loading the view.
    }

    @IBAction func showMore(_ sender: Any) {
        lbl_Content.numberOfLines = 0
    }
    
}

