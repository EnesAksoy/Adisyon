//
//  DeleteFoodVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 9.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DeleteFoodVC: UIViewController {
    
    @IBOutlet weak var foodName: UITextField!
    
    var eatNamesFromFirebase = [String] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()

 
        
        
    }
    

    @IBAction func deleteFoodButton(_ sender: Any) {
        
        if foodName.text == "" {
            showAlert(title: "HATA", message: "Lütfen yemek ismini giriniz")
        }
        nameMatchingFromFirebase()
        Database.database().reference().child("Foods").observe(.childAdded) { (snapshot) in
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let eatsVC = storyboard.instantiateViewController(withIdentifier: "EatsVC")
            
            self.present(eatsVC, animated: true, completion: nil)
        }
    }
    
    func nameMatchingFromFirebase() {
        Database.database().reference().child("Foods").observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as? NSDictionary
            let foodNames = snapshotValue?.allKeys as! [String]
            
            for f in foodNames {
                self.eatNamesFromFirebase.append(f)
            }
            for a in self.eatNamesFromFirebase {
                if self.foodName.text != a {
                    self.showAlert(title: "HATA", message: "Girdiğiniz yemek ismi yanlış")
                }
            print(a)}
            
        }
    }
}
