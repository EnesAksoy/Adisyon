//
//  AmountVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 15.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AmountVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var amountCollection: UICollectionView!
    
    var dataSnapshot : [String] = []
    var cellInTableName = ""
    var selectedCell = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getOrderDataFromFirebase()
    }
    func getOrderDataFromFirebase() {
        Database.database().reference().child("Orders").observe(.childAdded) { (snapshot) in
            self.dataSnapshot.append(snapshot.key)
            self.amountCollection.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSnapshot.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCell", for: indexPath) as! AmountCollectionViewCell
        
       cell.tableNameForAmount.text = dataSnapshot[indexPath.row]
        
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         selectedCell = dataSnapshot[indexPath.row]
        performSegue(withIdentifier: "toAmountPayment", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAmountPayment" {
            let selectedTable = segue.destination as! AmountPaymentVC
            selectedTable.amountTableName = selectedCell
        }
    }
    
    @IBAction func exitAmountVCButton(_ sender: Any) {
    }
    
    
    
}
