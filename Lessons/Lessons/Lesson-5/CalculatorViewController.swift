//
//  CalculatorViewController.swift
//  Lessons
//
//  Created by intern on 15.05.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    static let identifier = "CalculatorViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

}
