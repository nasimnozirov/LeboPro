//
//  Product.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 14.06.2023.
//

import Foundation

struct Product: Equatable {
    
    let name: String
    let price: Int
    let description: String
    let image: String
        
    static func getCoffee() -> [Product] {
        
        var products: [Product] = []
        
        let nameCoffee = DataManager.shared.nameCoffee.shuffled()
        let priceForCoffee = DataManager.shared.priceForCoffee.shuffled()
        let descriptionOfCoffee = DataManager.shared.descriptionOfCoffee.shuffled()
        let imageCoffee = DataManager.shared.imageCoffee.shuffled()
        
        let iterationCount = min(
            nameCoffee.count,
            priceForCoffee.count,
            descriptionOfCoffee.count,
            imageCoffee.count
        )
        
        for index in 0..<iterationCount {
            let product = Product(
                name: nameCoffee[index],
                price: priceForCoffee[index],
                description: descriptionOfCoffee[index],
                image: imageCoffee[index]
            )
            
                products.append(product)
        }
        return products
    }
    
    static func getTrening() -> [Product] {
        
        var products: [Product] = []
        
        let nameTrening = DataManager.shared.nameTrening
        let priceForTrening = DataManager.shared.priceForTrening
        let descriptionOfTrening = DataManager.shared.descriptionOfTrenings
        let imageTrening = DataManager.shared.imageTrening
        
        let iterationCount = min(
            nameTrening.count,
            priceForTrening.count,
            descriptionOfTrening.count,
            imageTrening.count
        )
        
        for index in 0..<iterationCount {
            let product = Product(
                name: nameTrening[index],
                price: priceForTrening[index],
                description: descriptionOfTrening[index],
                image: imageTrening[index]
            )
            
                products.append(product)
        }
        return products
    }
    
    static func getDevices() -> [Product] {
        
        var products: [Product] = []
        
        let nameDevice = DataManager.shared.nameDevice
        let priceForDevice = DataManager.shared.priceForDevices
        let descriptionOfDevice = DataManager.shared.descriptionOfDevices
        let imageDevice = DataManager.shared.imageDevice
        
        let iterationCount = min(
            nameDevice.count,
            priceForDevice.count,
            descriptionOfDevice.count,
            imageDevice.count
        )
        
        for index in 0..<iterationCount {
            let product = Product(
                name: nameDevice[index],
                price: priceForDevice[index],
                description: descriptionOfDevice[index],
                image: imageDevice[index]
            )
            
                products.append(product)
        }
        return products
    }
    
    static func getBravillor() -> [Product] {
        
        var products: [Product] = []
        
        let nameBravillor = DataManager.shared.nameBravillorProduct
        let priceForBravillor = DataManager.shared.priceForBravillor
        let descriptionOfBravillor = DataManager.shared.descriptionOfBravillor
        let imageBravillor = DataManager.shared.imageBravillorProduct
        
        let iterationCount = min(
            nameBravillor.count,
            priceForBravillor.count,
            descriptionOfBravillor.count,
            imageBravillor.count
        )
        
        for index in 0..<iterationCount {
            let product = Product(
                name: nameBravillor[index],
                price: priceForBravillor[index],
                description: descriptionOfBravillor[index],
                image: imageBravillor[index]
            )
            
                products.append(product)
        }
        return products
    }
    
}
