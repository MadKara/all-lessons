//
//  TableData.swift
//  Lessons
//
//  Created by intern on 14.05.2021.
//

import Foundation
import UIKit

struct TableData {
    
    let arrayOfControllers: [ControllerHeader] = [
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
        CalculateViewController.instance(),
        TipsyCalculatorViewController.instance(),
        WeatherViewController()
    ]
}
