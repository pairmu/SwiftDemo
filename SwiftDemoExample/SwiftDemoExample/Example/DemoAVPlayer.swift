//
//  DemoAVPlayer.swift
//  SwiftDemoExample
//
//  Created by Mistletoe on 2017/3/18.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit
import AVFoundation

class DemoAVPlayer: NSObject {
     class func play(path: String, superLayer: CALayer) {
        let url = NSURL.fileURL(withPath: path)
        let player = AVPlayer.init(url: url)
        let playerLayer = AVPlayerLayer.init(player: player)
        
        playerLayer.frame = superLayer.bounds
        superLayer.addSublayer(playerLayer)
        
        player.play()
    }
}
