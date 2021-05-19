//
//  CoinData.swift
//  Lessons
//
//  Created by intern on 19.05.2021.
//

import Foundation

struct CoinData: Codable {
    
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double

}
