//
//  TableSaveVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 1.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit

class TableSaveVC: UIViewController {

    @IBOutlet weak var tableName: UILabel!
    
    var table = TablesVC ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTableButton(_ sender: Any) {
        
        
        table.masalarDeneme.append((tableName.text)!)
        
        
    }
    

   
}
