//
//  ViewController.swift
//  ClassicTableView
//
//  Created by admin on 10/27/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cityNames = ["Seattle", "New York", "San Francisco", "Los Angles", "Vegas", "San Diego"]

    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        cell.textLabel?.text = cityNames[indexPath.row]
        return cell
    }
}

