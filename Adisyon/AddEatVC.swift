//
//  AddEatVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 8.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddEatVC: UIViewController {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var foodAmount: UITextField!
    
    var foodNameAmount:[String:String] = [:]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveFoodButton(_ sender: Any) {
        
        foodNameAmount = [foodName.text! : foodAmount.text!]
        
        if foodName.text == "" && foodAmount.text == ""{
         showAlert(title: "HATA", message: "Lütfen boş alanları doldurun")
        }else {
            Database.database().reference().child("Foods").childByAutoId().setValue(foodNameAmount)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let eatsVC = storyboard.instantiateViewController(withIdentifier: "EatsVC")
            
            present(eatsVC, animated: true, completion: nil)
        }
    }
}
