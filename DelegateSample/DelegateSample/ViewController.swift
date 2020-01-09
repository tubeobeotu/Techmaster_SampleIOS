//
//  ViewController.swift
//  DelegateSample
//
//  Created by Nguyễn Văn Tú on 1/9/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var v_Player: TPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        v_Player.delegate = self
    }
}

extension ViewController: TPlayerViewDelegate {
    func playAudioFromPlayerView() {
        print("play")
    }
}

