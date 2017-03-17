//
//  DemoScrollView.swift
//  SwiftDemo
//
//  Created by Mistletoe on 2017/3/16.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class DemoScrollView: UIView {
    // MARK: Initialize
    override class var layerClass: AnyClass {
        return CAScrollLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Initialize
    func setup() {
        self.layer.masksToBounds = true
        self.layer.contents = UIImage.init(named: "1")?.cgImage
        
        let reconginer = UIPanGestureRecognizer(target: self, action: #selector(pan(reconginer:)))
        self.addGestureRecognizer(reconginer)
    }
    
    func pan(reconginer: UIPanGestureRecognizer) {
        print("pan")
        
        var offset = self.bounds.origin
        offset.x -= reconginer.translation(in: self).x
        offset.y -= reconginer.translation(in: self).y
        
        print("\(offset)")
        
        let layer = self.layer as! CAScrollLayer
        
        layer.scroll(to: offset)
        reconginer.setTranslation(CGPoint(x: 0, y: 0), in: self)
    }
}
