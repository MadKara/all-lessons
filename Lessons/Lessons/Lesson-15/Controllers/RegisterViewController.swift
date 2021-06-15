//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var registerUsers = [User]()
    
    override func viewDidLoad() {
        loadRegisterUsers()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            if isValidEmail(email) {
                if isUnique(email) {
                    if isValidPassword(password) {
                        
                        let newUser = User(context: context)
                        newUser.email = email
                        newUser.password = password
                        
                        do {
                            try context.save()
                        } catch {
                            print("error")
                        }
                        print(newUser)
                        
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    } else {
                        let alert = UIAlertController(title: "Invalid password", message: "Try again.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    let alert = UIAlertController(title: "This email is already in use!", message: "Try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Invalid email", message: "Try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: - Check functionality
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ pass: String) -> Bool {
        let passRegEx = ".{6,}"

        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: pass)
    }
    
    func isUnique(_ email: String) -> Bool {
        
        for user in registerUsers {
            if email == user.value(forKey: "email") as? String {
                return false
            }
        }
        return true
    }
    
    //MARK: - Fetch register users
    
    func loadRegisterUsers() {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            registerUsers = try context.fetch(request)
        } catch {
            print("Error fetching users, \(error)")
        }
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! UsersViewController
        destinationVC.currentUser = emailTextfield.text!
    }
}
