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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgressTracker()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(progressViewClicked(_:)))
        progressView.addGestureRecognizer(tapGesture)
        
        self.title = homeTitleString
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func progressViewClicked(_ sender: Any){
        if let HealthJourneyStoryboard = UIStoryboard(name: "HealthJourney", bundle: nil).instantiateInitialViewController() as? HealthJourney{
            self.navigationController?.pushViewController(HealthJourneyStoryboard, animated: true)
        }
    }
}

