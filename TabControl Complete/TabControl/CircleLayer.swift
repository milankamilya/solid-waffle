
//
//  LogoLayer.swift
//  TabBarTest
//
//  Created by Milan Kamilya on 21/06/16.
//  Copyright © 2016 innofied. All rights reserved.
//

import UIKit
import QuartzCore

class CircleLayer: CAShapeLayer {

    class func getCircleLayer() -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        layer.geometryFlipped = true
        
        // Draw Beizer Path
        let beizer = UIBezierPath()
        //beizer.moveToPoint(CGPoint(x: 16.0,y: 16.0));
        beizer.addArcWithCenter(CGPoint(x: 32.0,y: 32.0), radius: 11.31, startAngle: 0.0, endAngle: 360.0, clockwise: true)
        
        layer.path = beizer.CGPath
        layer.bounds = CGPathGetBoundingBox(layer.path)
        
        
        return layer
    }
    
}
