//
//  ProfileUserModel.swift
//  TestExercise
//
//  Created by Dima on 19.01.22.
//

import Foundation

struct ProfileUserModel: Decodable {
    var dob: String
    var name: String
    var about: String
    var gender: String
    var address: String
    var company: String
    var location: LocationModel
    
    var age: Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let birthdayDate = dateFormater.date(from: dob)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }
}
