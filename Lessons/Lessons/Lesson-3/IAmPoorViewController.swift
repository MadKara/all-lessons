//
//  IAmPoorViewController.swift
//  Lessons
//
//  Created by intern on 14.05.2021.
//

import UIKit

class IAmPoorViewController: UIViewController, ControllerHeader {
    
    var titleProject: String = "I Am Poor"
    var imageProject: UIImage = #imageLiteral(resourceName: "keanuexploit1-1")

    static let identifier = "IAmPoorViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
