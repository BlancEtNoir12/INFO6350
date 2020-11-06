//
//  ViewController.swift
//  StockApp
//
//  Created by admin on 11/5/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    let apiKey = "a09a3e9bb6a569510bfa015ed47c2ffe"
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"
    
    @IBOutlet weak var txtStockName: UITextField!
    
    @IBOutlet weak var lblStockCEO: UILabel!
    @IBOutlet weak var lblStockPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockValue(_ sender: Any) {
        guard let stockName = txtStockName.text else { return }
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Value for \(stockName)")
        AF.request(url).responseJSON{ response in
            SwiftSpinner.hide()
            if response.error != nil {
                let alertController = UIAlertController(title: "Wrong request", message:"", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Try again", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }

            let stockJSON :JSON = JSON(response.data!)
            
            guard let ceo = stockJSON[0]["ceo"].rawString() else { return }
            guard let price = stockJSON[0]["price"].double else { return }
            
            self.lblStockCEO.text = ceo
            self.lblStockPrice.text = "\(price)"
        }
    }
}

