//
//  TablesVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 31.07.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TablesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var tablesCollection: UICollectionView!
    
    var tableNamesFromFirebase = [String]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       getDataFromFirebase()
        // Do any additional setup after loading the view.
    }
    
    func getDataFromFirebase(){
        Database.database().reference().child("TableNames").observe(DataEventType.childAdded) { (snapshot) in
            self.tableNamesFromFirebase.append(snapshot.value as! String)
            self.tablesCollection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.tableNamesFromFirebase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell", for: indexPath) as! TablesCollectionViewCell
        cell.tableNo.text = tableNamesFromFirebase[indexPath.row]
        cell.backgroundColor = UIColor.green
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
        cell?.backgroundColor = UIColor.green
    }
}
