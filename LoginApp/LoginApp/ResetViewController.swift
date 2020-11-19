//
//  ResetViewController.swift
//  LoginApp
//
//  Created by admin on 11/19/20.
//

import UIKit
import Firebase
import SwiftSpinner

class ResetViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitAction(_ sender: Any) {
        let email = txtEmail.text
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        SwiftSpinner.show("Loading...")
        
        Auth.auth().sendPasswordReset(withEmail: email!) { error in
            SwiftSpinner.hide()
            
            if error != nil {
                self.lblStatus.text = error?.localizedDescription
                return
            }
            
            self.lblStatus.text = "Sent a reset email. Please check."
        }
    }
    
}
