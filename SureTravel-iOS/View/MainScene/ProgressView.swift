//
//  ProgressView.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

/// UI for Progress box
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

    private let userDate = UserDataSource.getUserData()
    
    func setProgressTracker() {
        progressLabel.text = progressString
        userNameLabel.text = "\(userDate.userName)\n\(userDate.userSurename)"
        
        let calendar = Calendar.current
        
        if let startDate = calendar.date(from: self.userDate.getDate()),
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
