//
//  ViewController.swift
//  TabControl
//
//  Created by Milan Kamilya on 21/06/16.
//  Copyright © 2016 innofied. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var textForTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circle = CircleLayer.getCircleLayer()
        circle.position = CGPoint(x: view.layer.bounds.size.width/2,
                                  y: view.layer.bounds.size.height/2 + 10)
        circle.fillColor = UIColor.whiteColor().CGColor
        view.layer.addSublayer(circle)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = textForTitle
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}


