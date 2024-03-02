//
//  Networking.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import UIKit

class EventDetailedViewController: GradientViewController {
    private let UserData = UserDataSource.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = UserData.eventName
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.titleView?.tintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}

