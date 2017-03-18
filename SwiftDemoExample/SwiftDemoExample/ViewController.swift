//
//  ViewController.swift
//  SwiftDemoExample
//
//  Created by Mistletoe on 2017/3/17.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class LayerDelegate: NSObject, CALayerDelegate {
    func action(for layer: CALayer, forKey event: String) -> CAAction? {
        
        guard event == "moveRight" else {
            return nil
        }
        
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionTranslateX)
        animation.fromValue = UIColor.red
        animation.toValue = UIColor.blue
        animation.duration = 5
        
        return animation
    }
}

class DemoView: UIView {
    let delegate = LayerDelegate()
    
    lazy var sublayer: CALayer = {
        let layer = CALayer()
        layer.delegate = self.delegate
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func action(for layer: CALayer, forKey event: String) -> CAAction? {
        return sublayer.action(forKey: "backgroundColor")
    }
}

class ViewController: UIViewController, CALayerDelegate {
    var scrollView = UIScrollView()
    let scale = UIScreen.main.scale
    var change = true
    let demoLayer = CALayer()

    override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.view.backgroundColor = UIColor.lightGray
    }
    
    let colorLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        #if true
            colorLayer.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
            colorLayer.backgroundColor = UIColor.yellow.cgColor
            self.view.layer.backgroundColor = UIColor.yellow.cgColor
            
            let transition = CATransition()
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            self.view.layer.actions = ["backgroundColor": transition]
//            colorLayer.actions = ["backgroundColor": transition]
//            self.view.layer.addSublayer(colorLayer)
            
        #else
            demoView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
            demoView.backgroundColor = UIColor.red
            self.view.addSubview(demoView)
            
            // palyer
            let string = Bundle.main.path(forResource: "demo", ofType: "mov")
            DemoAVPlayer.play(path: string!, superLayer: self.view.layer)
            
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if self.change {
            self.colorLayer.backgroundColor = UIColor.blue.cgColor
            self.view.layer.backgroundColor = UIColor.blue.cgColor
        }
        else {
            self.colorLayer.backgroundColor = UIColor.red.cgColor
            self.view.layer.backgroundColor = UIColor.red.cgColor
        }
//        if self.change {
//            CATransaction.begin()
//            CATransaction.setAnimationDuration(5.0)
//            self.view.layer.backgroundColor = UIColor.yellow.cgColor
//            CATransaction.commit()
//        }
//        else {
//            UIView.animate(withDuration: 5, animations: {
//                self.view.backgroundColor = UIColor.blue
//            })
//        }
        self.change = !self.change
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

