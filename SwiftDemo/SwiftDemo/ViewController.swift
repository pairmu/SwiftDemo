//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Mistletoe on 2017/3/16.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        self.view.backgroundColor = UIColor.lightGray
        
//        let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
//        self.view.addSubview(view)
        
        // gradientLayer
//        let gradientLayer = DemoGradientLayer()
//        gradientLayer.showDemoForParentView(parentView: view)
        
        // replicatorLayer
//        let replicatorLayer = DemoReplicatorLayer()
//        replicatorLayer.showDemoReplicatorLayer(parentView: self.view)
        
        // DemoReflectionView
        let reflectionView = DemoReflectionView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        reflectionView.image = UIImage.init(named: "1")
        reflectionView.backgroundColor = UIColor.yellow
        self.view.addSubview(reflectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

