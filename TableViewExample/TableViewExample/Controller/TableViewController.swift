//
//  TableViewController.swift
//  TableViewExample
//
//  Created by admin on 10/27/20.
//

import UIKit

class TableViewController: UITableViewController {

    let cityNames = ["Seattle", "New York", "San Francisco", "Los Angles", "Vegas", "San Diego"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cityNames[indexPath.row]
        
        return cell
    }
    



}
