//
//  ViewController.swift
//  Lessons
//
//  Created by intern on 13.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var titles: [String] = [ "I am Poor", "I am Rich" ]
    var images: [UIImage] = [ #imageLiteral(resourceName: "keanuexploit1-1"), #imageLiteral(resourceName: "diamond") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let title = titles[indexPath.row]
        let image = images[indexPath.row]
        cell.labelCell?.text = title
        cell.imageCell.image = image
        
        return cell
    }
}
