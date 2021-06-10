//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var users = [User]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.getUsers()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        var email = ""
        var password = ""
        var checkRecord = false
        
        if let checkEmail = emailTextfield.text, let checkPassword = passwordTextfield.text {
            
            for item in users {
                email = item.value(forKey: "email") as! String
                password = item.value(forKey: "password") as! String
                
                if email == checkEmail && password == checkPassword {
                    checkRecord = true
                }
            }

            if checkRecord {
                self.performSegue(withIdentifier: K.loginSegue, sender: self)
            } else {
                let alert = UIAlertController(title: "User not found!", message: "Try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Warning!", message: "Please, enter email and password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getUsers() {
        do {
            users = try context.fetch(User.fetchRequest())
        } catch {
            print("Error fetching users data!")
        }
    }
}
