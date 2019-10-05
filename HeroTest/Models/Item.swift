//
//  Item.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

// MARK: - Item
struct Item: Codable {
    let gtin14: String
    let brandName, name, size: String?
    let ingredients, servingSize, servingsPerContainer: String?
    let calories, fatCalories: Int?
    let fat, saturatedFat, transFat, polyunsaturatedFat, monounsaturatedFat: Double?
    let cholesterol, sodium, potassium, carbohydrate: Int?
    let fiber, sugars, protein: Int?
    let author, publisher: String?
    let pages, alcoholByVolume: Int?
    let images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case gtin14
        case brandName = "brand_name"
        case name, size, ingredients
        case servingSize = "serving_size"
        case servingsPerContainer = "servings_per_container"
        case calories
        case fatCalories = "fat_calories"
        case fat
        case saturatedFat = "saturated_fat"
        case transFat = "trans_fat"
        case polyunsaturatedFat = "polyunsaturated_fat"
        case monounsaturatedFat = "monounsaturated_fat"
        case cholesterol, sodium, potassium, carbohydrate, fiber, sugars, protein, author, publisher, pages
        case alcoholByVolume = "alcohol_by_volume"
        case images
    }
}

// MARK: - Image
struct Image: Codable {
    let url: String?
}

typealias Items = [Item]
