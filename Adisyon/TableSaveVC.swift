//
//  TableSaveVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 1.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TableSaveVC: UIViewController {

    @IBOutlet weak var tableName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTableButton(_ sender: Any) {
        
        if tableName.text == ""{
            showAlert(title: "HATA", message: "Lütfen masa ismini giriniz")
        }else{
            Database.database().reference().child("TableNames").childByAutoId().setValue(tableName.text)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tablesVC = storyboard.instantiateViewController(withIdentifier: "TablesVC")
            
            present(tablesVC, animated: true, completion: nil)
        }
        
        
    }
}
