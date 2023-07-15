//
//  User.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 09.07.2023.
//

import Foundation

struct UserModel:Identifiable, Codable {
    let id: String
    let email: String
    let password: String
    
    let fullname: String
    let locatio: String
        
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    var basket: [Dishes] // корзина
}
