//
//  EatsVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 7.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EatsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var eatCollection: UICollectionView!
    
    
    var eatNamesFromFirebase = [String]()
    var selectedTableName = ""
    var savedOrderFirebase:[String:String] = [:]
    var snapshotValue = NSDictionary ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSnapshotValue()
        
        print("namee=====\(selectedTableName)")
       getEatDataFromFirebase()

    }
    func getSnapshotValue() {
        Database.database().reference().child("Foods").observe(.childAdded) { (snapshot) in
            self.snapshotValue = snapshot.value as! NSDictionary
            print(self.snapshotValue)
        }
      
    }
    
    func getEatDataFromFirebase() {
        
        Database.database().reference().child("Foods").observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as? NSDictionary
            let foodNames = snapshotValue?.allKeys as? [String]
            for f in foodNames! {
                self.eatNamesFromFirebase.append(f)
            }
            self.eatCollection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return eatNamesFromFirebase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eatCell", for: indexPath) as! EatCollectionViewCell
        cell.eatName.text = eatNamesFromFirebase[indexPath.row]
        cell.backgroundColor = UIColor.gray
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
        cell?.backgroundColor = UIColor.gray
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nameInCell = eatNamesFromFirebase[indexPath.row]
            if let value = self.snapshotValue.value(forKey: nameInCell) {
                self.savedOrderFirebase = [nameInCell:value] as! [String : String]
            }
           print(indexPath.row)
            print(self.savedOrderFirebase)
           // Database.database().reference().child("Ordered").child(self.selectedTableName)
        }
}
