//
//  ViewController.swift
//  Lessons
//
//  Created by intern on 13.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let tableData = TableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lessons"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(CustomTableViewCell.nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}
    //MARK: - UITableViewDelegate
    
    extension ViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    }

    //MARK: - UITableViewDataSource
    
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.arrayOfControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        let controller = tableData.arrayOfControllers[indexPath.row]
        
        cell.configure(with: controller.titleProject, image: controller.imageProject)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(tableData.arrayOfControllers[indexPath.row] as! UIViewController, animated: true)
    }
    
}
