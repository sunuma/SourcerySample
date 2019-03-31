//
//  LoginViewController.swift
//  SourcerySample
//
//  Created by ShinUnuma on 2019/03/31.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginIdTitle: UILabel!
    @IBOutlet weak var passwordTitle: UILabel!
    @IBOutlet weak var loginIdField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginAction() {
        guard let loginId = loginIdField.text else {
            return
        }
        guard let password = passwordField.text else {
            return
        }
        if login(id: loginId, password: password) {
            guard let storyboard = self.storyboard else { return }
            let vc = storyboard.instantiateViewController(withIdentifier: "List")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func login(id: String, password: String) -> Bool {
        return true
    }
}

