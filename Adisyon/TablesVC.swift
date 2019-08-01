//
//  TablesVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 31.07.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit

class TablesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    

    @IBOutlet weak var tablesCollection: UICollectionView!
    
    var masalarDeneme = ["masa 1", "masa 2", "masa 3", "masa 4", "masa 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.masalarDeneme.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell", for: indexPath) as! TablesCollectionViewCell
        cell.tableNo.text = masalarDeneme[indexPath.row]
        cell.backgroundColor = UIColor.blue
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print("\(indexPath.row)seçildi")
        
    }
    

}
