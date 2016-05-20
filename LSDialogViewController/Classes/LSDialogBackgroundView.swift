//
//  LSDialogBackgroundView.swift
//  LSDialogViewController
//
//  Created by Daisuke Hasegawa on 2016/05/15.
//  Copyright © 2016年 Libra Studio, Inc. All rights reserved.
//

import UIKit

public enum LSDialogBackgroundViewType {
    case Solid
    case Gradient
    case None
}

public class LSDialogBackgroundView: UIView {
    
    var backgroundViewType: LSDialogBackgroundViewType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if let type = self.backgroundViewType {
            switch type {
            case .Solid:
                self.drawBackgroundViewWithSolid()
            case .Gradient:
                self.drawBackgroundViewWihGradient()
            case .None:
                break
            }
        }
    }
    
    private func drawBackgroundViewWihGradient() {
        // CoreGraphics get CGContext.
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        let colors: [CGFloat] = [0.0, 0.0, 0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.75]
        let colorsCount: Int = 2
        let colorsLocation: [CGFloat] = [0.0, 1.0]
        let space: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
        let gradient: CGGradientRef = CGGradientCreateWithColorComponents(space, colors, colorsLocation, colorsCount)!
        
        // set position.
        let startCenter: CGPoint = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)
        let endCenter = startCenter
        let startRadius: CGFloat = 0.0
        let endRadius: CGFloat = min(self.bounds.size.width as CGFloat, self.bounds.size.height as CGFloat)
        
        // to gradiation.
        CGContextDrawRadialGradient(context, gradient, startCenter, startRadius, endCenter, endRadius, CGGradientDrawingOptions.DrawsAfterEndLocation)
    }
    
    private func drawBackgroundViewWithSolid() {
        
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRectMake(0, 0, self.bounds.width, self.bounds.height)
        
        //color set.
        CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.5);
        CGContextAddRect(context, rect);
        CGContextFillPath(context);
    }
}

