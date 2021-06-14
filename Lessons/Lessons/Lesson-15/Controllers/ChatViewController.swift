//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var messagesCoreData = [Message]()
    
    var selectedUser: User?
    var currentUser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadChatMessages()
    }
    
    func loadChatMessages() {

        let request: NSFetchRequest<Message> = Message.fetchRequest()
        let predicate = NSPredicate(format: "ANY parentUser.email == %@", currentUser)

        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        do {
            messagesCoreData = try context.fetch(request)
        } catch {
            print("Error fetching messages, \(error)")
        }

        self.tableView.reloadData()
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//            let indexPath = IndexPath(row: self.messagesCoreData.count - 1, section: 0)
//            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
//
//        }
    }
    
    func saveMessages() {
        do {
            try context.save()
        } catch {
            print("Error saving messages, \(error)")
        }
        tableView.reloadData()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text {
            let newMessage = Message(context: self.context)
            newMessage.text = messageBody
            self.messagesCoreData.append(newMessage)
            self.saveMessages()
        }
        DispatchQueue.main.async {
            self.messageTextfield.text = ""
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesCoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messagesCoreData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
    
        let user = message.parentUser == selectedUser   // !!
        cell.configureCell(with: user, messageText: message.text!)
        
        return cell
    }
}

