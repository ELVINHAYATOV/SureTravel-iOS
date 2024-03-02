//
//  GainedBadges.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class GainedBadges : UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var badge1Label: UILabel!
    @IBOutlet weak var badge2Label: UILabel!
    @IBOutlet weak var badge3Label: UILabel!

    private let titleString = NSLocalizedString("GAINED_BADGES", comment: "")
        
    func setBadges() {
        titleLabel.text = titleString
        badge1Label.text = "Marathon Milestone 2"
        badge2Label.text = "Marathon Milestone 1"
        badge3Label.text = "First Step Forward"
    }
}
