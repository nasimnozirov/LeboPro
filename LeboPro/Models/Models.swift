//
//  Models.swift
//  LoginAppInCode
//
//  Created by Nasim Nozirov on 28.03.2023.
//

import Foundation


struct User {
    var userName: String
    var password: String
    
    static func getUser() -> User {
        User(userName: "write your name!", password: ".")
    }
    
    
}

struct Basket {
    var product: [String]
    
    static func getProduct() -> Basket {
        Basket(product: ["MERCEDES", "BMW", "FERRARI", "JAGUAR", "MAZDA", "MUSTANG", "TESLA", "VOLKSWAGEN"])
    }
    
    
}
