//
//  DemoReplicatorLayer.swift
//  SwiftDemo
//
//  Created by Mistletoe on 2017/3/16.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class DemoReplicatorLayer: NSObject {
    func showDemoReplicatorLayer(parentView: UIView) {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = parentView.bounds
        parentView.layer.addSublayer(replicatorLayer)
        
        // subLayer
        let layer = CALayer()
        layer.frame = CGRect(origin: CGPoint(), size: CGSize(width: 100, height: 100))
        layer.position = replicatorLayer.position
        
        layer.backgroundColor = UIColor.white.cgColor
        replicatorLayer.addSublayer(layer)
        
        // instance count
        replicatorLayer.instanceCount = 10

        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, 200, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI / 5.0), 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -200, 0)

        // instance change
        replicatorLayer.instanceTransform = transform
        replicatorLayer.instanceBlueOffset = -0.1
        replicatorLayer.instanceRedOffset = 0.1
    }
}
