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
        
        // gradientLayer
        let gradientLayer = DemoGradientLayer()
        
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        self.view.addSubview(view)
        
        gradientLayer.showDemoForParentView(parentView: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

