//
//  WelcomeViewController.swift
//  LogInApp_02
//
//  Created by Andrey Kovalev on 08.10.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var userName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userName = userName {
            welcomeLabel.text = "Welcome, \(userName)!"
        }
    }

    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        userName = nil
        welcomeLabel.text = ""
        
    }
}
