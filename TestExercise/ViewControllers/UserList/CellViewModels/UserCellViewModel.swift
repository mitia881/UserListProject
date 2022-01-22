//
//  UserCellViewModel.swift
//  TestExercise
//
//  Created by Dima on 19.01.22.
//

import Foundation

protocol UserIdentifierable {
    var userId: String { get }
}

final class UserCellViewModel: BaseCellViewModel, UserIdentifierable {
    
    var userId: String {
        return model.id
    }
    
    private let model: UserModel
    
    var gender: String {
        return model.profile.gender
    }
    var name: String {
        return model.profile.name
    }
    var age: String {
        return "возраст " + calcAge(birthday: model.profile.dob)
    }
    
    init(model: UserModel, cellIdentifier: String) {
        self.model = model
        super.init(cellIdentifier: cellIdentifier)
    }
    

    func calcAge(birthday: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return "\(age!)"
    }
    
}
