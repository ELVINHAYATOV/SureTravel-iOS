//
//  HealthJourney.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class HealthJourney: GradientViewController {
    @IBOutlet weak var motivationalLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var vitalsLabel: UILabel!
    
    private let healthJourneyTitleString = NSLocalizedString("HEALTH_JOURNEY_TITLE", comment: "")
    private let motivationalString = NSLocalizedString("HEALTH_MOTIVATION", comment: "")
    private let metricsString = NSLocalizedString("HEALTH_VITAL_METRICS", comment: "")
    
    private let userDate = UserDataSource.getUserData()
    
    func setJourney(){
        let calendar = Calendar.current
        
        if let startDate = calendar.date(from: self.userDate.getDate()),
           let endDate = calendar.date(byAdding: .year, value: 1, to: startDate) {
            
            let pastDays = calendar.dateComponents([.day], from: startDate, to: Date()).day ?? 0
            
            let totalDays = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
            
            resultLabel.text = "Trt to be healty for another \(totalDays - pastDays) days."
            progressBar.progress = Float(pastDays) / Float(totalDays)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = healthJourneyTitleString
        self.motivationalLabel.text = motivationalString
        self.vitalsLabel.text = metricsString
        
        setJourney()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.titleView?.tintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
    }
    
}

