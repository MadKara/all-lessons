//
//  TableData.swift
//  Lessons
//
//  Created by intern on 14.05.2021.
//

import Foundation
import UIKit

struct TableData {
    let titles: [String] = [
        "I am Rich",
        "I am Poor",
        "Dicee",
        "Magic 8 Ball",
        "Calculator",
        "Xylophone"
    ]
    
    let images: [UIImage] = [ #imageLiteral(resourceName: "diamond"), #imageLiteral(resourceName: "keanuexploit1-1"), #imageLiteral(resourceName: "DiceeLogo"), #imageLiteral(resourceName: "ball3") , #imageLiteral(resourceName: "calc"), #imageLiteral(resourceName: "xylophone")]
    
    let arrayOfControllers = [
        IAmRichViewController(),
        IAmPoorViewController(),
        DiceeViewController(),
        Magic8BallViewController(),
        CalculatorViewController(),
        XylophoneViewController()
    ]
    
}
