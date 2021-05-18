//
//  MultipleQuizViewController.swift
//  Lessons
//
//  Created by intern on 16.05.2021.
//

import UIKit

class MultipleQuizViewController: UIViewController, ControllerHeader {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    
    
    static let identifier = "MultipleQuizViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    var titleProject: String = "Multiple Quiz"
    var imageProject: UIImage = #imageLiteral(resourceName: "question-mark")
    
    var quizBrain = MultipleQuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let titleAnswer = quizBrain.getAnswersText()
        
        choiceOneButton.setTitle(titleAnswer[0], for: .normal)
        choiceTwoButton.setTitle(titleAnswer[1], for: .normal)
        choiceThreeButton.setTitle(titleAnswer[2], for: .normal)
        
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear
    }
}
