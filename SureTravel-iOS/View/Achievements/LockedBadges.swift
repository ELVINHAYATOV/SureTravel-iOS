//
//  LockedBadges.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class LockedBadges : UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var badge1Label: UILabel!
    @IBOutlet weak var badge2Label: UILabel!
    @IBOutlet weak var badge3Label: UILabel!

    private let titleString = NSLocalizedString("LOCKED_BADGES", comment: "")
        
    func setBadges() {
        titleLabel.text = titleString
        badge1Label.text = "Health Guru"
        badge2Label.text = "Cardio King"
        badge3Label.text = "Marathon Milestone 3"
    }
}

