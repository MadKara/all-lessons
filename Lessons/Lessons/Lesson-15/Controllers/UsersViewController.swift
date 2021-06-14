//
//  UsersViewController.swift
//  Lessons
//
//  Created by intern on 11.06.2021.
//

import UIKit
import CoreData

class UsersViewController: UITableViewController {

    var currentUser = ""
    var users = [User]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(currentUser)
        self.loadUser()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.userCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = users[indexPath.row].email
        return cell
    }

    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.chatSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ChatViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedUser = users[indexPath.row]
            destinationVC.currentUser = currentUser
        }
    }
    
    //MARK: - Data manipulation methods
    
    func loadUser() {
        let request: NSFetchRequest<User> = User.fetchRequest()
        //let predicate = NSPredicate(format: "email != %@", currentUser)
        //request.predicate = predicate
        
        do {
            users = try context.fetch(request)
        } catch {
            print("Error fetching users, \(error)")
        }
        tableView.reloadData()
    }
}
