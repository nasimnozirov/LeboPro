//
//  User.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 14.06.2023.
//

import Foundation

struct User {
    var userName: String
    var password: String
    
    static func getUser() -> User {
        User(userName: "write your name!", password: "")
    }
    
    
    
}
