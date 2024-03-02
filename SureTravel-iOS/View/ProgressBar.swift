//
//  ProgressBar.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class ProgressBar: UIProgressView{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
        super.layoutSubviews()
        subviews.forEach { subview in
            subview.layer.masksToBounds = true
            subview.layer.cornerRadius = self.frame.width / 2.0
        }
    }
}
