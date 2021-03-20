//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Ajaydip Singh on 3/19/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButtonOutlet.isEnabled = false
        loginButtonOutlet.alpha = 0.5
        
        [usernameField, passwordField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    

        // Do any additional setup after loading the view.
    }
    
    
    @objc func editingChanged(_ textField: UITextField) {

        if (usernameField.text!.isEmpty) || (passwordField.text!.isEmpty) {
            loginButtonOutlet.alpha = 0.5
            loginButtonOutlet.isEnabled = false
        } else {
            loginButtonOutlet.alpha = 1.0
            loginButtonOutlet.isEnabled = true
        }        
    }
    
    
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text
        let password = passwordField.text
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
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
