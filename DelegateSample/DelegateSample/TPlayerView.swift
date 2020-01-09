//
//  TPlayerView.swift
//  DelegateSample
//
//  Created by Nguyễn Văn Tú on 1/9/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit
protocol TPlayerViewDelegate {
    func playAudioFromPlayerView()
}
class TPlayerView: BaseNibView {
    var delegate:TPlayerViewDelegate?
    @IBAction func playAudio(_ sender: Any) {
        self.delegate?.playAudioFromPlayerView()
    }
    
}
