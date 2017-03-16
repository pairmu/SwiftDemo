//
//  DemoReflectionView.swift
//  SwiftDemo
//
//  Created by Mistletoe on 2017/3/16.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class DemoReflectionView: UIImageView {
    
    var subLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Private Methods
    func setUp() {
        let layer = self.layer as! CAReplicatorLayer
        
        // instance
        layer.instanceCount = 2
    
        subLayer.frame = CGRect(origin: CGPoint(), size: CGSize(width: layer.bounds.size.width, height: layer.bounds.size.height))
        subLayer.backgroundColor = UIColor.blue.cgColor
        layer.addSublayer(subLayer)
        
        // transform
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, self.layer.bounds.size.height + 4.0, 0)
        transform = CATransform3DScale(transform, 1, -1, 0)
        
        layer.instanceTransform = transform
        layer.instanceAlphaOffset = -0.6
    }
    
    override var image: UIImage? {
        set {
            subLayer.contents = newValue?.cgImage
        }
        
        get {
            return UIImage(cgImage: subLayer.contents as! CGImage)
        }
    }
    
    override var backgroundColor: UIColor? {
        set {
            subLayer.backgroundColor = newValue?.cgColor
        }
        
        get {
            return UIColor(cgColor: subLayer.backgroundColor!)
        }
    }
    
    // change layer
    override class var layerClass: AnyClass {
        get {
            return CAReplicatorLayer.self
        }
    }
    
}
