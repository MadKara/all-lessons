//
//  MessageCell.swift
//  Lessons
//
//  Created by intern on 24.05.2021.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    
    public func configureCell(with currenctUser: Bool, messageText: String) {
        
        label.text = messageText
        
        if currenctUser {
            leftImageView.isHidden = true
            rightImageView.isHidden = false
            messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            leftImageView.isHidden = false
            rightImageView.isHidden = true
            messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
