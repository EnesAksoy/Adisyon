//
//  TableSaveVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 1.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit

class TableSaveVC: UIViewController {

  
    @IBOutlet weak var tableName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTableButton(_ sender: Any) {
       
        
       
        dismiss(animated: true, completion: nil)
         
        
    }
    

   
}
