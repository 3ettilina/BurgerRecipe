//
//  RecipesListViewController.swift
//  BurgerRecipe
//
//  Created by Bettina Carrizo on 6/10/20.
//  Copyright © 2020 Bettina Carrizo. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {

    @IBOutlet weak var tvRecipes: UITableView!
    
    var model = BurgerModel()
    var selectedType: BurgerType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvRecipes.dataSource = self
        tvRecipes.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didChangeFilter(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            selectedType = nil
        case 1:
            selectedType = .meat
        case 2:
            selectedType = .vegetarian
        default:
            break
        }
        
        tvRecipes.reloadData()
    }
}

extension RecipesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return how many rows we will have for the specified selection.
        model.getBurgers(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get the current cell to fill.
        let cell = tvRecipes.dequeueReusableCell(withIdentifier: "BurgerCell", for: indexPath)
        
        // Get the information of the burger that will be in that cell.
        let burger = model.getBurgers(forType: selectedType)[indexPath.row]
        
        // Add properties of the burger to the cell
        cell.textLabel?.text = burger.name
        cell.detailTextLabel?.text = burger.ingredients
        cell.imageView?.image = UIImage(named: burger.thumbnailName)
        
        return cell
    }
}

extension RecipesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
