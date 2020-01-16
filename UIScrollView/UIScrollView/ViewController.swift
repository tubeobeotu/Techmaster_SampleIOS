//
//  ViewController.swift
//  UIScrollView
//
//  Created by Nguyễn Văn Tú on 1/13/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var svl_Main: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        svl_Main.delegate = self
    }
    
    @IBAction func scrollTo(_ sender: Any) {
        svl_Main.contentInset = UIEdgeInsets.init(top: 100, left: 100, bottom: 300, right: 100)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}

