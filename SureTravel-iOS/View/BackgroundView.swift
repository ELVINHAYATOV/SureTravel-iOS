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


class GradientBackground {
    static let color1 = UIColor(named: "gradiantBackground1")!.cgColor
    static let color2 = UIColor(named: "gradiantBackground2")!.cgColor
    static let minAngleDeg =  Double(40)
    static let maxAngleDeg =  Double(60)

    static func apply(to view: UIView) -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = [color1, color2]

        let randomValue = minAngleDeg + Double(arc4random_uniform(UInt32(maxAngleDeg - minAngleDeg + 1)))
        let angle = randomValue * .pi / 180.0
        
        let x = cos(angle)
        let y = sin(angle)
        gradientLayer.startPoint = CGPoint(x: CGFloat(x), y: CGFloat(y))
        gradientLayer.endPoint = CGPoint(x: CGFloat(1 - x), y: CGFloat(1 - y))

        gradientLayer.frame = view.bounds

        view.layer.insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
}

class GradientViewController : UIViewController {
    private var gradientLayer: CAGradientLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gradientLayer = GradientBackground.apply(to: self.view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer?.frame = view.bounds
    }
}
