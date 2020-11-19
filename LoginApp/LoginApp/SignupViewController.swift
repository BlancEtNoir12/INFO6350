//
//  SignupViewController.swift
//  LoginApp
//
//  Created by admin on 11/19/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignupViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitAction(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        SwiftSpinner.show("Creating...")
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            SwiftSpinner.hide()
            
            if error != nil {
                self.lblStatus.text = error?.localizedDescription
                return
            }
            
            self.lblStatus.text = "Sign up succeed!"
        }
    }
    
}
