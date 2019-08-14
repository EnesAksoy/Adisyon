//
//  eatsAndDrinksVC.swift
//  Adisyon
//
//  Created by ENES AKSOY on 7.08.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit

class SelectEatsAndDrinksVC: UIViewController {
    
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        //print("name==== \(name)")
    }
    @IBAction func selectEatButton(_ sender: Any) {
        performSegue(withIdentifier: "SelectToEat", sender: nil)
    }
    
    @IBAction func selectDrinkButton(_ sender: Any) {
        performSegue(withIdentifier: "SelectToDrink", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectToEat" {
            let selectToEat = segue.destination as! EatsVC
            selectToEat.selectedTableName = name
            
        }
        if segue.identifier == "SelectToDrink" {
            let selectToDrink = segue.destination as! DrinksVC
            selectToDrink.selectedTableName = name
        }
    }
    


}
