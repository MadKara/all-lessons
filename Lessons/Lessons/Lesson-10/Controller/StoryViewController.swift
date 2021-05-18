//
//  StoryViewController.swift
//  Lessons
//
//  Created by intern on 16.05.2021.
//

import UIKit

class StoryViewController: UIViewController, ControllerHeader {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var titleProject: String = "Destini"
    var imageProject: UIImage = #imageLiteral(resourceName: "story")
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }


    @IBAction func choiceMade(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        
        storyBrain.nextStory(userChoice: userChoice)
     
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoiceTwo(), for: .normal)
    }
}
