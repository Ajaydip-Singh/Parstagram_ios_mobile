//
//  RegisterViewController.swift
//  Parstagram
//
//  Created by Ajaydip Singh on 3/20/21.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var usernameRegisterField: UITextField!
    @IBOutlet weak var passwordRegisterField: UITextField!
    @IBOutlet weak var emailRegisterField: UITextField!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButtonOutlet.isEnabled = false
        signUpButtonOutlet.alpha = 0.5
        
        [usernameRegisterField, passwordRegisterField, emailRegisterField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })

    }
    
    @objc func editingChanged(_ textField: UITextField) {

        if (usernameRegisterField.text!.isEmpty) || (passwordRegisterField.text!.isEmpty) || (emailRegisterField.text!.isEmpty) {
            signUpButtonOutlet.alpha = 0.5
            signUpButtonOutlet.isEnabled = false
        } else {
            signUpButtonOutlet.alpha = 1.0
            signUpButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameRegisterField.text
        user.password = passwordRegisterField.text
        user.email = emailRegisterField.text
        
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
