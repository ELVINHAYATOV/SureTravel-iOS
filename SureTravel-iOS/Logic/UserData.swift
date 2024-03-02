//
//  UserData.swift
//  SureTravel-iOS
//
//  Created by Alvin on 02.03.24.
//

import Foundation

struct UserData : Codable{
    //MARK: - Data for Progress View
    var dateDay: Int = 1
    var dateMonth: Int = 1
    var dateYear: Int = 2020
    var userName: String = ""
    var userSurename: String = ""
    
    func getDate() -> DateComponents {
        var dateComponents = DateComponents()
        dateComponents.year = dateYear
        dateComponents.month = dateMonth
        dateComponents.day = dateDay
        return dateComponents
    }
    //MARK: - Data for Networking
    var eventName: String = ""
    var eventLocation: String = ""
    var eventDate: String = ""
    var eventInfo: String = ""
}

class UserDataSource {
    static func getUserData() -> UserData{
        do {
            if let data = loadDataFromFile(fileName: "User.json"){
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(UserData.self, from: data)
                return decodedData
            }
        }
        catch {
            print("Coding failed \(error)")
        }
        return UserData()
    }
    
    private static func loadDataFromFile(fileName: String) -> Data? {
        var fileURL : URL?
            
        if let URLString = Bundle.main.path(forResource: fileName, ofType: nil){
            fileURL = URL(fileURLWithPath: URLString)
        }

        do {
            if let File = fileURL{
                let data = try Data(contentsOf: File)
                return data
            }
            return nil
        } catch {
            print("Error loading data:", error)
            return nil
        }
    }

}
