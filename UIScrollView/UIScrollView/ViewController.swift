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
        svl_Main.contentInset = UIEdgeInsets.init(top: 300, left: 0, bottom: 0, right: 0)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}

