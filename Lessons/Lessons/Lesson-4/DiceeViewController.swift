//
//  DiceeViewController.swift
//  Lessons
//
//  Created by intern on 15.05.2021.
//

import UIKit

class DiceeViewController: UIViewController, ControllerHeader {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    static let identifier = "DiceeViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    var titleProject: String = "Dicee"
    var imageProject: UIImage = #imageLiteral(resourceName: "DiceeLogo")
    
    @IBAction func rollButtinPressed(_ sender: UIButton) {
    
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray.randomElement()
        
    }

}
