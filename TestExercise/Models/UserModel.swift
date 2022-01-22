//
//  UserList.swift
//  TestExercise
//
//  Created by Dima on 19.01.22.
//

import Foundation

struct UserModel: Decodable {
    var id: String
    var email: String
    var roles: [String]
    var apiKey: String
    var profile: ProfileUserModel
    var username: String?
//    var createdAt: String
//    var updatedAt: String
}
