//
//  ViewController.swift
//  SocketIOChat
//
//  Created by Nguyễn Văn Tú on 11/18/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img_sample: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendMess(_ sender: Any) {
        SocketIOManager.sharedInstance.sendMess(mess: "Techmaster")
    }
    @IBAction func login(_ sender: Any) {
        SocketIOManager.sharedInstance.login(userName: "TechmasterSupport")
    }
    
    @IBAction func logout(_ sender: Any) {
        SocketIOManager.sharedInstance.logout()
    }
    
    
}

