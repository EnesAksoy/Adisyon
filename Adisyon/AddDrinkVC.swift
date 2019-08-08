//
//  AddDrinkVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 8.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddDrinkVC: UIViewController {
    
    @IBOutlet weak var drinkName: UITextField!
    @IBOutlet weak var drinkAmount: UITextField!
    
    var drinkNameAmount:[String:String] = [:]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func addDrinkButton(_ sender: Any) {
        
        drinkNameAmount = [drinkName.text! : drinkAmount.text!]
        
        if drinkName.text == "" && drinkAmount.text == ""{
            showAlert(title: "HATA", message: "Lütfen boş alanları doldurun")
        }else {
        Database.database().reference().child("Drinks").childByAutoId().setValue(drinkNameAmount)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let drinksVC = storyboard.instantiateViewController(withIdentifier: "DrinksVC")
        
        present(drinksVC, animated: true, completion: nil)
        
        
    }
    
  }

}
