//
//  User.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 19/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Double
    var name: String
    var phone: String
    var email: String
}

extension User {
    static func sample() -> User {
        // use current timeInterval as id, just for the demo purpose
        User(id: Date().timeIntervalSinceReferenceDate,
             name: "John Doe",
             phone: "04778095252",
             email: "johndoe@test.com")
    }
}

// MARK: - User Storage
protocol UserStorageProtocol {
    var user: User? { get set }
}

extension UserDefaults: UserStorageProtocol {
    
    var user: User? {
        get {
            guard let data = object(forKey: "UserObject") as? Data else { return nil }
            return try? JSONDecoder().decode(User.self, from: data)
        }
        
        set {
            guard let userObject = newValue else { set(nil, forKey: "UserObject"); return }
            set(try? JSONEncoder().encode(userObject), forKey: "UserObject")
        }
    }
    
}

// MARK: -
