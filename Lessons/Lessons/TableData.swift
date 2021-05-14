//
//  TableData.swift
//  Lessons
//
//  Created by intern on 14.05.2021.
//

import Foundation
import UIKit

struct TableData {
    let titles: [String] = [ "I am Rich", "I am Poor" ]
    let images: [UIImage] = [  #imageLiteral(resourceName: "diamond"), #imageLiteral(resourceName: "keanuexploit1-1") ]
    let arrayOfControllers = [IAmRichViewController(), IAmPoorViewController()]
    
}
