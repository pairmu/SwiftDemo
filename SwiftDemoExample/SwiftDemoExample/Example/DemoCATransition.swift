//
//  DemoCATransition.swift
//  SwiftDemoExample
//
//  Created by Mistletoe on 2017/4/9.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class DemoCATransition: NSObject {
    // MARK: Lazy load
    lazy var images: NSArray = {
        let image0 = UIImage(named: "demo_00_00.jpg")
        let image1 = UIImage(named: "demo_00_01.jpg")
        let image2 = UIImage(named: "demo_00_02.jpg")
        let image3 = UIImage(named: "demo_00_03.jpg")
        let image4 = UIImage(named: "demo_00_04.jpg")
        let image5 = UIImage(named: "demo_00_05.jpg")
        
        return [image0!, image1!, image2!, image3!, image4!, image5!]
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = (self.images.firstObject as! UIImage)
        return imageView
    }()
    
    static let catransition = DemoCATransition()
    
    class func showCATransition(view: UIView) {
        view.addSubview(catransition.imageView)
        
//        UIView.animate(withDuration: 1.0, delay: 0, options: .transitionFlipFromLeft, animations: {
//            let currentImage = catransition.imageView.image
//            var currentIndex = catransition.images.index(of: currentImage!)
//            print("currentIndex = \(currentIndex)")
//            currentIndex = (currentIndex + 1) % catransition.images.count
//            catransition.imageView.image = (catransition.images[currentIndex] as! UIImage)
//        }, completion: nil)
        
        
//        catransition.imageView.layer.convertTime(<#T##t: CFTimeInterval##CFTimeInterval#>, to: <#T##CALayer?#>)
        
        UIView.transition(with: catransition.imageView, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            catransition.imageView.layer.speed = 100
            let currentImage = catransition.imageView.image
            var currentIndex = catransition.images.index(of: currentImage!)
            print("currentIndex = \(currentIndex)")
            currentIndex = (currentIndex + 1) % catransition.images.count
            catransition.imageView.image = (catransition.images[currentIndex] as! UIImage)
        }, completion: nil)

//        let transition = CATransition()
//        transition.type = kCATransitionFade
//        view.layer.add(transition, forKey: nil)
//        
//        let currentImage = catransition.imageView.image
//        var currentIndex = catransition.images.index(of: currentImage!)
//        print("currentIndex = \(currentIndex)")
//        currentIndex = (currentIndex + 1) % catransition.images.count
//        catransition.imageView.image = (catransition.images[currentIndex] as! UIImage)
    }
}
