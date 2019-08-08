//
//  DrinksVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 7.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit

class DrinksVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    
    @IBOutlet weak var drinkCollection: UICollectionView!
    
    
    var drinksNameFromFirebase = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDrinkButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinksNameFromFirebase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "drinkCell", for: indexPath) as! DrinkCollectionViewCell
        
        cell.drinkName.text = drinksNameFromFirebase[indexPath.row]
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
    
    
   

}
