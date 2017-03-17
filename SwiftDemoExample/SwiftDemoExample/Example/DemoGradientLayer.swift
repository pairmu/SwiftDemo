//
//  DemoGradientLayer.swift
//  SwiftDemo
//
//  Created by Mistletoe on 2017/3/16.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class DemoGradientLayer: NSObject {
    
    func showDemoForParentView(parentView: UIView) {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = parentView.bounds
        parentView.layer.addSublayer(gradientLayer)
        
        gradientLayer.colors = [
            UIColor.red.cgColor,
            UIColor.blue.cgColor,
        ]
        
        // location
        gradientLayer.locations = [0.0, 0.25, 0.5]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
}
