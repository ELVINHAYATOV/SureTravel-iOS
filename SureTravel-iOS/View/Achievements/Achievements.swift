//
//  Achievements.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class AchievementsViewController: GradientViewController {
    @IBOutlet weak var gainedBadges: GainedBadges!
    @IBOutlet weak var lockedBadges: LockedBadges!

    private let aboutString = NSLocalizedString("ABOUT", comment: "")
    private let achievementsTitleString = NSLocalizedString("ACHIEVEMENTS_TITLE", comment: "")

    private let UserData = UserDataSource.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = achievementsTitleString
        
        gainedBadges.setBadges()
        lockedBadges.setBadges()

        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.titleView?.tintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
    }
}

