//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, ControllerHeader {

    var titleProject: String = "FlashChat"
    var imageProject: UIImage = #imageLiteral(resourceName: "YouAvatar")
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ""
        
        var charIndex = 0.0
        let titleText = "⚡️FlashChat"
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
       
    }
    

    static public func instance() -> WelcomeViewController {
        let storyboard = UIStoryboard(name: "FlashChat", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController

    }
}
