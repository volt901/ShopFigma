//
//  Dishes.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 09.07.2023.
//

import Foundation

struct Dishes: Codable{
    var id: Int
    var name: String
    var price: Int
    var weight: Int
    var description: String
    var image_url: String
    var tegs: [String]
    
    static let allDishes: [Dishes] = Bundle.main.decode(file: "dishes.json")
    
    static let sampleDishes: Dishes = allDishes[0]
}
    
  
  


