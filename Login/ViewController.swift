//
//  ViewController.swift
//  Login
//
//  Created by Lars Dansie on 9/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordValidationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordValidationLabel.isHidden = true
    }
  
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        let password = isValidPassword(myPassword: passwordText.text!)
        if(password == false) {
            passwordValidationLabel.isHidden = false
            passwordValidationLabel.text = "Password is invalid"
            passwordValidationLabel.textColor = UIColor.red
        } else {
            passwordValidationLabel.isHidden = false
            passwordValidationLabel.text = "Success password is valid!"
            passwordValidationLabel.textColor = UIColor.systemGreen
            
        }
    }
    func isValidPassword(myPassword: String) -> Bool {
        let passwordRegex = "^(?=.*[@,.!@#$%^&*<>?+=-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordCheck.evaluate(with: myPassword)
    }
}

