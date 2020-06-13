//
//  BurgerModel.swift
//  BurgerRecipe
//
//  Created by Bettina Carrizo on 6/13/20.
//  Copyright © 2020 Bettina Carrizo. All rights reserved.
//

import Foundation

class BurgerModel {
    var burgers: [Burger] = []
    
    init(){
//        Steps for parsing JSON file
//        1. Get the URL of file.
        if let url = Bundle.main.url(forResource: "BurgerResources/burgers", withExtension: "json") {
//        2. Transform URL into DAO.
            do {
                let data = try Data(contentsOf: url)
//        3. Use JSON Decoder to create specific Burger objects.
                burgers = try JSONDecoder().decode([Burger].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func getBurgers(forType type: BurgerType?) -> [Burger] {
        guard let type = type else { return burgers }
        return burgers.filter { $0.type == type }
    }
}
