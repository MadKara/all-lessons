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
        let title = tableData.titles[indexPath.row]
        let image = tableData.images[indexPath.row]
        cell.labelCell?.text = title
        cell.imageCell.image = image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(tableData.arrayOfControllers[indexPath.row], animated: true)
    }
    
}
