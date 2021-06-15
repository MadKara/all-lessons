//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CoreData

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var messages = [Message]()
    
    var selectedUser: User?
//    {
//        didSet {
//            loadChatMessages()
//        }
//    }
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

        let request: NSFetchRequest<Message> = NSFetchRequest(entityName: "Message")

        let predSelectedUser = NSPredicate(format: "parentUser.email MATCHES %@", selectedUser!.email!)
        let predCurrentUser = NSPredicate(format: "parentUser.email MATCHES %@", currentUser)
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predSelectedUser, predCurrentUser])
        
        request.predicate = compoundPredicate
        
        do {
            messages = try context.fetch(request)
        } catch {
            print("Error fetching messages, \(error)")
        }
        print(messages)

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
            newMessage.parentUser = self.selectedUser
            self.messages.append(newMessage)
            print(messages)
            self.saveMessages()
        }
        DispatchQueue.main.async {
            self.messageTextfield.text = ""
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        let user = message.parentUser?.email == selectedUser?.email
        cell.configureCell(with: user, messageText: message.text!)
        
        return cell
    }
}

