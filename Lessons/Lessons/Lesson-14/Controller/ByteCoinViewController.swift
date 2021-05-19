//
//  ByteCoinViewController.swift
//  Lessons
//
//  Created by intern on 19.05.2021.
//

import UIKit

class ByteCoinViewController: UIViewController, ControllerHeader {
  
    static let identifier = "ByteCoinViewController"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var titleProject: String = "ByteCoin"
    var imageProject: UIImage = #imageLiteral(resourceName: "bitcoin")
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManager.delegate = self
    }
}

//MARK: - UIPickerViewDataSource

extension ByteCoinViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
}

//MARK: - UIPickerViewDelegate

extension ByteCoinViewController: UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currency)
    
        //currencyLabel.text = currency
    }
    
}

//MARK: - CoinManagerDelegate

extension ByteCoinViewController: CoinManagerDelegate {
    
    func didUpdateCurrency(_ coinManager: CoinManager, exchange: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = exchange.priceOfCoinString
            self.currencyLabel.text = exchange.currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
