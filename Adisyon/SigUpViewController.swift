//
//  SigUpViewController.swift
//  Adisyon
//
//  Created by ENES AKSOY on 31.07.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import FirebaseAuth

class SigUpViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sigUp(_ sender: Any) {
        if email.text!.isEmpty && password.text!.isEmpty && passwordAgain.text!.isEmpty {
            showAlert(title: "HATA", message: "Lütfen boş alan bırakmayınız")
        }
        if password.text != passwordAgain.text {
            showAlert(title: "HATA", message: "Şifre tekrarlarınız yanlış")
        }
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            
            if let error = error {
                self.showAlert(title: "HATA", message: error.localizedDescription)
            }else{
                self.showAlert(title: "TEBRİKLER", message: "Kullanıcı Kaydınız Tamamlanmıştır")
            }
        }
    }
    @IBAction func sigIn(_ sender: Any) {
        
    }
    
    

}
