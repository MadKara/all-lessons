//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController, ControllerHeader {

    var titleProject: String = "FlashChat"
    var imageProject: UIImage = #imageLiteral(resourceName: "YouAvatar")
    
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.appName
        
   
    }
    

    static public func instance() -> WelcomeViewController {
        let storyboard = UIStoryboard(name: "FlashChat", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController

    }
}
