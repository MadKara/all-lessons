//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    
    let stories = [
        Story(
            title: "You are sitting on a sofa and decide to grab some food so you can peacefully watch \"Empire strikes back\" instead of doing diploma. You tell yourself that this film is the last one for today, but deep inside, know that's a lie. Suddenly see that outside your window, something is sparkling.",
            choice1: "Go to check.", choice1Destination: 2,
            choice2: "Nevermind and go for the food.", choice2Destination: 1
        ),
        Story(
            title: "There is nothing in the kitchen. You stay near the empty fridge and think, is it possible to die because of an old yogurt? The challenge of life and death. Almost like not finished diploma two weeks before the first deadline of antiplagiarism. You hear some noises from your room and return. There is still sparkling from your window. Do you think that that ghost better remembers all IOS App Design Patterns?",
            choice1: "Check on him.", choice1Destination: 2,
            choice2: "Grab yogurt and return to your room.", choice2Destination: 3
        ),
        Story(
            title: "You come close and see a man in a robe with a lightsaber standing right in front of you. He's trying to say something, but you can't hear anything.",
            choice1: "Open the window and say, \"Hello there.\"", choice1Destination: 5,
            choice2: "Close the curtains.", choice2Destination: 4
        ),
        Story(
            title: "You eat yogurt while watching the film. Maybe it is a curse from heaven for making nothing—a terrible choice. You fall sick for the next several days.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "The situation is weird and even scary. Not so frightening like the teacher of programming from Lviv Polytechnic, but still. The thought of university doesn't get out of your head. Better return to the diploma. You win, Lviv Polytechnic.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "\"General Kenobi!\" yell stranger and runs away. Finally! A sing from heaven. You close the window and return to the sofa to continue to watch a film. Not today, diploma, not today.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        )
    ]
    
    var storyNumber = 0
    
    mutating func nextStory(userChoice: String){
        if userChoice == stories[storyNumber].choice1{
            storyNumber = stories[storyNumber].choice1Destination
        } else {
            storyNumber = stories[storyNumber].choice2Destination
        }
    }
    
    func getStoryTitle() -> String{
        return stories[storyNumber].title
    }
    
    func getChoiceOne() -> String{
        return stories[storyNumber].choice1
    }
    
    func getChoiceTwo() -> String{
        return stories[storyNumber].choice2
    }
}
