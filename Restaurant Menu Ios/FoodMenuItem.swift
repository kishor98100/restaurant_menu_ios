//
//  FoodMenuItem.swift
//  Restaurant Menu Ios
//
//  Created by Kishor Mainali on 10/6/20.
//

import UIKit

class FoodMenuItem: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodNameView: UILabel!
    
 func setFood(food:Food){
        foodImageView.image = UIImage(named: food.image!)
        foodNameView.text = food.name!
    }
}
