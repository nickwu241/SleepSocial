//
//  SignUpViewController.swift
//  SleepSocial
//
//  Created by Vivian Lam on 2017-09-17.
//  Copyright © 2017 Sleep Social. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        guard let userName = userNameTextField.text,
            let password = passwordTextField.text else {
            return
        }
        
        if confirmPasswordTextField.text == password {
            
        }
        //signUp(username: userName, password: password)
        signUp(username: userName, password: password)
        print("Username=\(userName),PW=\(password)")
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
