//
//  NetworkLayer.swift
//  TestExercise
//
//  Created by Dima on 19.01.22.
//

import Foundation
class NetworkLayer {
    
    func getUserList(completion: @escaping([UserModel])->()) {
        guard let url = URL(string: "https://api.json-generator.com/templates/SZnw46OaN8BE/data?access_token=xdpwrb0nafo3ypzxe64ffqr0ohvpyrcxd0heoktb") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data , _ , _  in
            guard let data = data else {
                return
            }
            guard let userList = try? JSONDecoder().decode([UserModel].self, from: data) else {
            return
            }
            DispatchQueue.main.async {
                completion(userList)
            }
        }.resume()
    }
}
