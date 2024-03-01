//
//  BackgroundView.swift
//  SureTravel-iOS
//
//  Created by Alvin on 01.03.24.
//

import UIKit

class BackgroundView : UIView{
    let color1 = UIColor(named: "gradiantBackground1")!.cgColor
    let color2 = UIColor(named: "gradiantBackground2")!.cgColor
    let angleDeg =  Double(50)
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         let gradientLayer = layer as! CAGradientLayer
         
         let angle = angleDeg * .pi / 180.0
         let x = cos(angle)
         let y = sin(angle)
         gradientLayer.startPoint = CGPoint(x: CGFloat(x), y: CGFloat(y))
         gradientLayer.endPoint = CGPoint(x: CGFloat(1 - x), y: CGFloat(1 - y))
         
         gradientLayer.colors = [color1, color2]
     }
}
