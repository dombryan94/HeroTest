//
//  ItemDetailViewModel.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 05/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation


class ItemDetailViewModel {
    
    let item: Item
    
    var displayText: String {
        return """
        GTIN: \(item.gtin14)\n\n
        Brand Name: \(item.brandName ?? "--")\n
        Size: \(item.size ?? "--")\n
        
        Author: \(item.author ?? "--")\n
        Publisher: \(item.publisher ?? "--")\n
        Pages: \(item.pages?.toString ?? "--")\n
        
        Ingredients: \(item.ingredients ?? "--")\n
        Serving Size: \(item.servingSize ?? "--")\n
        Servings Per Contrainer: \(item.servingsPerContainer ?? "--")\n
        Calories: \(item.calories?.toString ?? "--")\n
        Fat Calories: \(item.fatCalories?.toString ?? "--")\n
        Fat: \(item.fat?.toString ?? "--")\n
        Saturated Fat: \(item.saturatedFat?.toString ?? "--")\n
        Transfat: \(item.transFat?.toString ?? "--")\n
        Polyunsaturated Fat: \(item.polyunsaturatedFat?.toString ?? "--")\n
        Monounsaturated Fat: \(item.monounsaturatedFat?.toString ?? "--")\n
        Cholesterol: \(item.cholesterol?.toString ?? "--")\n
        Sodium: \(item.sodium?.toString ?? "--")\n
        Potassium: \(item.potassium?.toString ?? "--")\n
        Carbohydrate: \(item.carbohydrate?.toString ?? "--")\n
        fiber: \(item.fiber?.toString ?? "--")\n
        sugars: \(item.sugars?.toString ?? "--")\n
        protein: \(item.protein?.toString ?? "--")\n
        Alcohol By Volume: \(item.alcoholByVolume?.toString ?? "--")\n
        """
    }
    
    init(item: Item) {
        self.item = item
    }
}

extension Double {
    var toString: String {
        return String(format: ".%", self)
    }
}

extension Int {
    var toString: String {
        return String(self)
    }
}
