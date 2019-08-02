//
//  SigInViewController.swift
//  Adisyon
//
//  Created by ENES AKSOY on 31.07.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseAuth

class SigInViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var token: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sigIn(_ sender: Any) {
        
        if (email.text?.isEmpty)! && (password.text?.isEmpty)! && (token.text?.isEmpty)! {
            showAlert(title: "HATA", message: "Lütfen boş alan bırakmayınız")
        }else{
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                if error != nil {
                    self.showAlert(title: "HATA", message: error!.localizedDescription)
                }else{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let orderOrAmountVC = storyboard.instantiateViewController(withIdentifier: "OrderOrAmountVC")
                    
                    self.present(orderOrAmountVC, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func sigUp(_ sender: Any) {
    }
    
}

extension UIViewController {
    func showAlert (title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert,animated:true,completion:nil)
    }
}
