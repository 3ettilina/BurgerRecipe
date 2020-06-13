//
//  Burger.swift
//  BurgerRecipe
//
//  Created by Bettina Carrizo on 6/13/20.
//  Copyright © 2020 Bettina Carrizo. All rights reserved.
//

import Foundation

struct Burger: Decodable {
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: BurgerType
}

enum BurgerType: String, Decodable {
    case vegetarian = "vegetarian"
    case meat = "meat"
}
