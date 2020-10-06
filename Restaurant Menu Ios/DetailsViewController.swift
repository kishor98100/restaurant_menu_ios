//
//  DetailsViewController.swift
//  Restaurant Menu Ios
//
//  Created by Kishor Mainali on 10/6/20.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsFoodName: UILabel!
    
    @IBOutlet weak var foodDescription: UITextView!
    
    var food:Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsFoodName.text = food?.name!
        detailsImageView.image = UIImage(named: food!.image!)
        foodDescription.text = food?.description!

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
