//
//  DeleteDrinkVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 12.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DeleteDrinkVC: UIViewController {
    
    @IBOutlet weak var drinkName: UITextField!
    @IBOutlet weak var drinkAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func deleteButton(_ sender: Any) {
        if drinkName.text == nil {
            showAlert(title: "HATA", message: "Lütfen İçecek İsmini Giriniz")
        }else{
            Database.database().reference().child("Drinks").queryOrdered(byChild: drinkName.text!).queryEqual(toValue: drinkAmount.text!).observeSingleEvent(of: .childAdded) { (snapshot) in
                snapshot.ref.removeValue()
                snapshot.ref.removeAllObservers()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let drinksVC = storyboard.instantiateViewController(withIdentifier: "DrinksVC")
                self.present(drinksVC, animated: true, completion: nil)
            }
//            Database.database().reference().child("Drinks").queryOrdered(byChild: drinkName.text!).queryEqual(toValue: drinkAmount.text!).observe(.childAdded) { (snapshot) in
//                snapshot.ref.removeValue()
//                snapshot.ref.removeAllObservers()
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let drinksVC = storyboard.instantiateViewController(withIdentifier: "DrinksVC")
//                self.present(drinksVC, animated: true, completion: nil)
//            }
        }
    }
}
