//
//  Categories.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 08.07.2023.
//

import Foundation

struct Categories: Codable{
        var id: Int
        var name: String
        var image_url: String
    
    static let allCategories : [Categories] = Bundle.main.decode(file: "json.json")
    static let sampleCategories:Categories = allCategories[0]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project!")
        }
        let decoder = JSONDecoder()
        
        guard let loadeData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project!")
        }
        return loadeData
    }
}
//class CategoriesModel: ObservableObject {
//    @Published var categories: [Categories] = []

//    var animals: [Categories] = load("json.json")
//
//    func load<T: Decodable>(_ filename: String) -> T {
//        let data: Data
//
//        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//        }
//
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//        }
//
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
    
//    func fetch() {
//        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url){[weak self]data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do{
//                let categories = try JSONDecoder().decode([Categories].self, from: data)
//                DispatchQueue.main.async {
//                    self?.categories = categories
//                }
//            }
//            catch{
//                print(error)
//            }
//        }
//        task.resume()
//    }
//}
