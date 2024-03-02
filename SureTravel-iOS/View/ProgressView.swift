//
//  ProgressView.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class ProgressView : UIView{
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!

    private let progressString = NSLocalizedString("PROGRESS", comment: "")
    private let startDateString = NSLocalizedString("START_DATE", comment: "")
    private let endDateString = NSLocalizedString("END_DATE", comment: "")

    private let userName = "User\nName"
    private let date : DateComponents = {
        var dateComponents = DateComponents()
        dateComponents.year = 2024
        dateComponents.month = 1
        dateComponents.day = 13
        return dateComponents
    }()
    
    func setProgressTracker() {
        progressLabel.text = progressString
        userNameLabel.text = userName
        
        let calendar = Calendar.current
        
        if let startDate = calendar.date(from: self.date),
           let endDate = calendar.date(byAdding: .year, value: 1, to: startDate) {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            let startDateFormated = dateFormatter.string(from: startDate)
            let endDateFormated = dateFormatter.string(from: endDate)

            startDateLabel.text = "\(startDateString) \(startDateFormated)"
            endDateLabel.text = "\(endDateString) \(endDateFormated)"
            
            let pastDays = calendar.dateComponents([.day], from: startDate, to: Date()).day ?? 0
            
            let totalDays = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
            
            daysLabel.text = "\(pastDays) / \(totalDays)"
            progressBar.progress = Float(pastDays) / Float(totalDays)
        }
    }
}
