//
//  LoginViewController.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  let loginViewModel = LoginViewModel()
  @IBOutlet weak var usernameView: UIView!
  @IBOutlet weak var passwordView: UIView!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signInButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      editCorner(usernameView)
      setPlaceholder(usernameTextField, text: NSLocalizedString("username", comment: ""))
      editCorner(passwordView)
      setPlaceholder(passwordTextField, text: NSLocalizedString("password", comment: ""))
    }
    
  @IBAction func signIn(_ sender: Any) {
    loginViewModel.generateToken(username: usernameTextField.text!, password: passwordTextField.text!)
  }
  
  func editCorner(_ view: UIView) {
    view.layer.cornerRadius = 20
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor(red:0.67, green:0.65, blue:0.80, alpha:1.0).cgColor
  }
  func setPlaceholder(_ textfield : UITextField , text : String){
    textfield.placeholder = text
  }

}
