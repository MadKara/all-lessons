//
//  Magic8BallViewController.swift
//  Lessons
//
//  Created by intern on 15.05.2021.
//

import UIKit

class Magic8BallViewController: UIViewController, ControllerHeader {

    @IBOutlet weak var imageView: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    static let identifier = "Magic8BallViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    var titleProject: String = "Magic 8 Ball"
    var imageProject: UIImage = #imageLiteral(resourceName: "ball2")
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        imageView.image = ballArray.randomElement()
    }

}
