//
//  DeleteTableVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 6.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DeleteTableVC: UIViewController {
    
    
    @IBOutlet weak var tableName: UITextField!
    
    //var tableNamesArray = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        if tableName.text == "" {
            showAlert(title: "HATA", message: "Lütfen masa ismini giriniz")
        }else{
            
           // nameMatchingFromFirebase()
            

            Database.database().reference().child("TableNames").queryOrdered(byChild: "tableName").queryEqual(toValue: tableName.text!).observe(.childAdded) { (snapshot) in
            snapshot.ref.removeValue()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tablesVC = storyboard.instantiateViewController(withIdentifier: "TablesVC")
            self.present(tablesVC, animated: true, completion: nil)
        }
      }
    }
//    func nameMatchingFromFirebase(){
//        Database.database().reference().child("TableNames").observe(DataEventType.childAdded) { (snapshot) in
//
//            let values = snapshot.value as! NSDictionary
//            let tableNames = values["tableName"] as! String
//
//            self.tableNamesArray.append(tableNames)
//
////            for name in self.tableNamesArray{
////                if self.tableName.text != name {
////                    self.showAlert(title: "HATA", message: "Böyle bir masa yok.")
////                }
////            }
//        }
//    }
    


}
