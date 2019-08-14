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
    var nameInCell = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.getDataFromFirebase()
      
    }
    
    func getDataFromFirebase(){
        Database.database().reference().child("TableNames").observe(DataEventType.childAdded) { (snapshot) in
            
            let values = snapshot.value as! NSDictionary
            let tableNames = values["tableName"] as! String
            
            self.tableNamesFromFirebase.append(tableNames)
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        nameInCell = tableNamesFromFirebase[indexPath.row]
        
        performSegue(withIdentifier: "selectedTable", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectedTable"{
             let selectedTable = segue.destination as! SelectEatsAndDrinksVC 
                 selectedTable.name = nameInCell
           
        }
    }    
}
