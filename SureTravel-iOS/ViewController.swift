//
//  ViewController.swift
//  SureTravel-iOS
//
//  Created by Alvin on 01.03.24.
//

import UIKit

class ViewController: UIViewController {
    private let homeTitleString = NSLocalizedString("HOME_TITLE", comment: "")

    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var eventView: EventView!

    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgressTracker()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(progressViewClicked(_:)))
        progressView.addGestureRecognizer(tapGesture)
        
        eventView.setEvent()
        
        self.title = homeTitleString
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
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
}

