//
//  AmountPaymentVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 15.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AmountPaymentVC: UIViewController {
    
    @IBOutlet weak var tableName: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    var dataSnapshot : [Double] = []
    var amountTableName = ""
    var sum : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataOrderFromFirebase()
        tableName.text = "Masa İsmi: \(amountTableName)"
    }
    func totalAmountCalculation() {
        
    }
    func getDataOrderFromFirebase() {
        Database.database().reference().child("Orders").child(amountTableName).observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as? NSDictionary
            let amounts = snapshotValue?.allValues as? [String]
            
            for a in amounts! {
                let doubleAmount = Double(a)
                self.dataSnapshot.append(doubleAmount!)
                self.sum = self.sum + doubleAmount!
            }
            self.totalAmount.text = "Toplam Tutar=  \(self.sum)"

        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        Database.database().reference().child("Orders").child(amountTableName).observe(.childAdded) { (snapshot) in
            snapshot.ref.removeValue()
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let amountVC = storyboard.instantiateViewController(withIdentifier: "AmountVC")
        
        present(amountVC, animated: true, completion: nil)
        
    }
    
    
}
