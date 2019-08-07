//
//  EatsVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 7.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit

class EatsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var eatCollection: UICollectionView!
    
    
    var eatNamesFromFirebase = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addEatsButton(_ sender: Any) {
        
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
    
    

    
}
