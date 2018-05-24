//
//  LSDialogBackgroundView.swift
//  LSDialogViewController
//
//  Created by Daisuke Hasegawa on 2016/05/15.
//  Copyright © 2016年 Libra Studio, Inc. All rights reserved.
//

import UIKit

public enum LSDialogBackgroundViewType {
    case solid
    case gradient
    case none
}

open class LSDialogBackgroundView: UIView {
    var backgroundViewType: LSDialogBackgroundViewType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        if let type = self.backgroundViewType {
            switch type {
            case .solid:
                self.drawBackgroundViewWithSolid()
            case .gradient:
                self.drawBackgroundViewWihGradient()
            case .none:
                break
            }
        }
    }
    
    fileprivate func drawBackgroundViewWihGradient() {
        let context = UIGraphicsGetCurrentContext()!
        let colors: [CGFloat] = [0.0, 0.0, 0.0 ,0.0 ,0.0 ,0.0 ,0.0 ,0.75]
        let colorsCount = 2
        let colorsLocation: [CGFloat] = [0.0, 1.0]
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorSpace: space, colorComponents: colors, locations: colorsLocation, count: colorsCount)!
        let startCenter = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        let endCenter = startCenter
        let startRadius: CGFloat = 0.0
        let endRadius = min(self.bounds.size.width as CGFloat, self.bounds.size.height as CGFloat)
        
        context.drawRadialGradient(gradient, startCenter: startCenter, startRadius: startRadius, endCenter: endCenter, endRadius: endRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
    
    fileprivate func drawBackgroundViewWithSolid() {
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)

        context?.setFillColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        context?.addRect(rect)
        context?.fillPath()
    }
}
