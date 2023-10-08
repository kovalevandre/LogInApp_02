//
//  LoginViewController.swift
//  LogInApp_02
//
//  Created by Andrey Kovalev on 08.10.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func forgotUserNameButtonTapped(_ sender: UIButton) {
        showAlert(title: "Forgot User Name?", message: "User name is 'User_23'")
    }

    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        showAlert(title: "Forgot Password?", message: "Password is 'gateway'")
    }

    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let enteredUserName = userNameTextField.text, let enteredPassword = passwordTextField.text else {
            return false
        }
        
        if enteredUserName == "User_23" && enteredPassword == "gateway" {
            return true
        } else {
            showAlert(title: "Error", message: "Wrong User Name or Password")
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let welcomeVC = segue.destination as? WelcomeViewController {
            welcomeVC.userName = userNameTextField.text ?? ""
        }
    }

    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
                userNameTextField.text = ""
                passwordTextField.text = ""
        
    }
}
