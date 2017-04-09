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
        #if true
            // bezierPath
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 0, y: 150))
            bezierPath.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
            
            // pathLayer
            let pathLayer = CAShapeLayer()
            pathLayer.path = bezierPath.cgPath
            pathLayer.fillColor = UIColor.clear.cgColor
            pathLayer.strokeColor = UIColor.red.cgColor
            pathLayer.lineWidth = 3.0
            
            view.layer.addSublayer(pathLayer)
            
            // ship
            let shipLayer = CALayer()
            shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
            shipLayer.position = CGPoint(x: 0, y: 150)
            shipLayer.contents = UIImage(named: "demo1")?.cgImage
            
            view.layer.addSublayer(shipLayer)
            
            // animation
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.duration = 4.0
            animation.path = bezierPath.cgPath
            shipLayer.add(animation, forKey: nil)
            
        #else
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
        #endif
    }
}
