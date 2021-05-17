//
//  TableData.swift
//  Lessons
//
//  Created by intern on 14.05.2021.
//

import Foundation
import UIKit

let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
let vc = storyboard.instantiateViewController(withIdentifier: "CalculateViewController")

let storyboard2 = UIStoryboard(name: "Tipsy", bundle: nil)
let vc2 = storyboard2.instantiateViewController(withIdentifier: "TipsyCalculatorViewController")

struct TableData {
    
    let titles: [String] = [
        "I am Rich",
        "I am Poor",
        "Dicee",
        "Magic 8 Ball",
        "Calculator",
        "Xylophone",
        "Egg Timer",
        "Quizz",
        "Multiple Quizz",
        "Destini",
        "BMI",
        "Tipsy",
        "Clima"
    ]
    
    let images: [UIImage] = [ #imageLiteral(resourceName: "diamond"), #imageLiteral(resourceName: "keanuexploit1-1"), #imageLiteral(resourceName: "DiceeLogo"), #imageLiteral(resourceName: "ball3") , #imageLiteral(resourceName: "calc"), #imageLiteral(resourceName: "xylophone"), #imageLiteral(resourceName: "medium_egg"), #imageLiteral(resourceName: "question-mark"), #imageLiteral(resourceName: "question-mark"), #imageLiteral(resourceName: "story") , #imageLiteral(resourceName: "bmi"), #imageLiteral(resourceName: "tip"), #imageLiteral(resourceName: "apple-weather")]
    
    let arrayOfControllers = [
        IAmRichViewController(),
        IAmPoorViewController(),
        DiceeViewController(),
        Magic8BallViewController(),
        CalculatorViewController(),
        XylophoneViewController(),
        EggTimerViewController(),
        QuizViewController(),
        MultipleQuizViewController(),
        StoryViewController(),
        vc,
        vc2,
        WeatherViewController()
    ]
    
}
