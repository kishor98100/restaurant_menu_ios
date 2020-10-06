//
//  ViewController.swift
//  Restaurant Menu Ios
//
//  Created by Kishor Mainali on 10/6/20.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
  
    
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    var listOfFoods = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoods()
        self.foodCollectionView.delegate = self
        self.foodCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    func loadFoods() {
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")! as String
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            let dict = plist as! [[String:String]]
            for food in dict{
                listOfFoods.append(Food(name: food["name"]!, description: food["description"]!, image: food["image"]!))
            }
        } catch  {
           print("cannot read file")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listOfFoods.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: listOfFoods[indexPath.row])
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let destination = segue.destination as? DetailsViewController {
                if let  food = sender as? Food {
                    destination.food = food
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FoodMenuItem = collectionView.dequeueReusableCell(withReuseIdentifier: "cellForFood", for: indexPath) as! FoodMenuItem
        cell.setFood(food: listOfFoods[indexPath.row])
        return cell
    }

}

