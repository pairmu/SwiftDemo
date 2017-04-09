//
//  DemoCAAnimation.swift
//  SwiftDemoExample
//
//  Created by Mistletoe on 2017/4/8.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class DemoCAAnimation: NSObject {
    class func showAnimationForView(view: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.duration = 2.0
        animation.values = [
            UIColor.blue.cgColor,
            UIColor.red.cgColor,
            UIColor.green.cgColor,
            UIColor.blue.cgColor,
            UIColor.yellow.cgColor
        ]
        view.layer.add(animation, forKey: "backgroundColor")
    }
}
