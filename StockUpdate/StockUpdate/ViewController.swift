//
//  ViewController.swift
//  StockUpdate
//
//  Created by admin on 11/5/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    let apiKey = "a09a3e9bb6a569510bfa015ed47c2ffe"
    let apiURL = "https://financialmodelingprep.com/api/v3/quote/"
    
    @IBOutlet weak var txtStockName: UITextField!
    
    
    @IBOutlet weak var lblStockValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockValue(_ sender: Any) {
        guard let stockName = txtStockName.text else { return }
        
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Value for \(stockName)")
        Alamofire.request(url).responseJSON { (response) in
            SwiftSpinner.hide()
            if response.result.isSuccess{
                guard let jsonString = response.result.value else { return }
                guard let stockJSON: [JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 { return }
                guard let symbol = stockJSON[0]["symbol"].rawString() else { return }
                guard let price = stockJSON[0]["price"].double else { return }
                
                self.lblStockValue.text = "Price for \(symbol) = \(price)"
            }
        }
    }
    
}

