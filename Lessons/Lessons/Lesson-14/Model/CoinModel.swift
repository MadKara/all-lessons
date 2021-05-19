//
//  CoinModel.swift
//  Lessons
//
//  Created by intern on 19.05.2021.
//

import Foundation

struct CoinModel {
    let currency: String
    let priceOfCoin: Double
    
    var priceOfCoinString: String {
        return String(format: "%.2f", priceOfCoin)
    }
}
