//
//  XylophoneViewController.swift
//  Lessons
//
//  Created by intern on 15.05.2021.
//

import UIKit
import AVFoundation

class XylophoneViewController: UIViewController {

    
    static let identifier = "XylophoneViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundname: sender.currentTitle!)
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1
        }
    }
    
    func playSound(soundname: String) {
        
        let url = Bundle.main.url(forResource: soundname, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
