//
//  HealthJourney.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class HealthJourney: GradientViewController {
    private let healthJourneyTitleString = NSLocalizedString("HEALTH_JOURNEY_TITLE", comment: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = healthJourneyTitleString
    }
}

