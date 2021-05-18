//
//  IAmRichViewController.swift
//  Lessons
//
//  Created by intern on 14.05.2021.
//

import UIKit

class IAmRichViewController: UIViewController, ControllerHeader {
    
    var titleProject: String = "I Am Rich"
    var imageProject: UIImage = #imageLiteral(resourceName: "diamond")

    static let identifier = "IAmRichViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
