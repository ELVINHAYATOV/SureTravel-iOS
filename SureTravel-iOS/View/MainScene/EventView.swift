//
//  EventView.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import Foundation
import UIKit

class EventView : BackgroundView {
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!

    private let moreInfoString = NSLocalizedString("MORE_INFO", comment: "")
    
    private let userData = UserDataSource.getUserData()
    
    func setEvent() {
        eventName.text = userData.eventName
        eventDate.text = userData.eventDate
        eventLocation.text = userData.eventLocation
    }
}
