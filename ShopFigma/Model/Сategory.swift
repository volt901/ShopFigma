//
//  Сategory.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 08.07.2023.
//

import Foundation

struct Сategory: Codable{
    var name: String
    var background: String
    var id: Int
    var image_url: String

    static let allСategory: [Сategory] = Bundle.main.decode(file: "category.json")
    static let sampleСategory: Сategory = allСategory[0]
}
