//
//  ViewController.swift
//  SureTravel-iOS
//
//  Created by Alvin on 01.03.24.
//

import UIKit

class ViewController: UIViewController {
    private let homeTitleString = NSLocalizedString("HOME_TITLE", comment: "")
    private let achievementsString = NSLocalizedString("ACHIEVMENTS", comment: "")


    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var eventView: EventView!
    @IBOutlet weak var achievementsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgressTracker()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(progressViewClicked(_:)))
        progressView.addGestureRecognizer(tapGesture)
        
        eventView.setEvent()
        
        let iconImage = UIImage(systemName: "gear")
        let iconBarButtonItem = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(settingsTapped))
        self.navigationItem.rightBarButtonItem = iconBarButtonItem
        
        self.title = homeTitleString
        self.achievementsButton.setTitle(achievementsString, for: .normal)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func progressViewClicked(_ sender: Any){
        if let HealthJourneyStoryboard = UIStoryboard(name: "HealthJourney", bundle: nil).instantiateInitialViewController() as? HealthJourney{
            self.navigationController?.pushViewController(HealthJourneyStoryboard, animated: true)
        }
    }
    
    @IBAction func moreInfoClicked(_ sender: Any) {
        if let EventDetailedStoryboard = UIStoryboard(name: "EventDetailed", bundle: nil).instantiateInitialViewController() as? EventDetailedViewController{
            self.navigationController?.pushViewController(EventDetailedStoryboard, animated: true)
        }
    }
    @IBAction func achivmentClicked(_ sender: Any) {
        if let AchievementsStoryboard = UIStoryboard(name: "AchievementsScene", bundle: nil).instantiateInitialViewController() as? AchievementsViewController {
            self.navigationController?.pushViewController(AchievementsStoryboard, animated: true)
        }
    }
    
    @objc func settingsTapped() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
    }
}

