//
//  ViewController.swift
//  GCD
//
//  Created by Nguyễn Văn Tú on 3/1/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func serialQueue1() {
        print("----------------------------------")
        let serialQueue = DispatchQueue(label: "serial.queue")
        serialQueue.async {
            print("Task 1")
            sleep(2)
        }
        serialQueue.async {
            print("Task 2")
            sleep(2)
        }
        serialQueue.async {
            print("Task 3")
        }
    }
    
    func concurrentQueue1() {
        print("----------------------------------")
        let concurrentQueue = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)

        concurrentQueue.async {
            print("Task 1")
        }
        concurrentQueue.async {
            print("Task 2")
        }
    }
    @IBAction func actionSerialQueue(_ sender: Any) {
        serialQueue1()
    }
    @IBAction func actionConcurrentQueue(_ sender: Any) {
        concurrentQueue1()
    }
    

}

