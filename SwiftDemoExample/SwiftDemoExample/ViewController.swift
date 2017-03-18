//
//  ViewController.swift
//  SwiftDemoExample
//
//  Created by Mistletoe on 2017/3/17.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CALayerDelegate {
    var scrollView = UIScrollView()
    let scale = UIScreen.main.scale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        #if true
            // palyer
            let string = Bundle.main.path(forResource: "demo", ofType: "mov")
            DemoAVPlayer.play(path: string!, superLayer: self.view.layer)
            
        #else
            // scrollView
            scrollView.frame = self.view.bounds
            scrollView.backgroundColor = UIColor.red
            self.view.addSubview(scrollView)
            
            // DemoCATiledLayer
            let tileLayer = CATiledLayer()
            tileLayer.frame = CGRect(x: 0, y: 0, width: 2048, height: 2048)
            tileLayer.contentsScale = scale
            tileLayer.delegate = self
            
            scrollView.layer.addSublayer(tileLayer)
            scrollView.contentSize = tileLayer.frame.size
            tileLayer.setNeedsDisplay()
        #endif
    }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        let tileLayer = layer as! CATiledLayer
        let bounds = ctx.boundingBoxOfClipPath
        
        let x = floor(bounds.origin.x / tileLayer.tileSize.width * scale)
        let y = floor(bounds.origin.y / tileLayer.tileSize.height * scale)
        
        let imageName = String(format: "demo_%02i_%02i", Int(x), Int(y))  //String(format: "demo_%02d_%02d", x, y)
        print(imageName)
        
        let imagePath = Bundle.main.path(forResource: imageName, ofType: "jpg")
        let image = UIImage.init(contentsOfFile: imagePath!)
        
        UIGraphicsPushContext(ctx)
        image?.draw(in: bounds)
        UIGraphicsPopContext()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("didReceiveMemoryWarning")
    }
}

