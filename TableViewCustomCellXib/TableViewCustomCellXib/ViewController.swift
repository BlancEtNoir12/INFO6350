//
//  ViewController.swift
//  TableViewCustomCellXib
//
//  Created by admin on 11/5/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arr = [ImageData]()
     
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        let ballardLocks = ImageData(image: UIImage(named: "BallardLocks")!, title: "Ballard Locks")
        let computersMuseum = ImageData(image: UIImage(named: "ComputersMuseum")!, title: "Computers Museum")
        let discoveryPark = ImageData(image: UIImage(named: "DiscoveryPark")!, title: "Discovery Park")
        let glassGarden = ImageData(image: UIImage(named: "GlassGarden")!, title: "Glass Garden")
        let internationalDistrict = ImageData(image: UIImage(named: "InternationalDistrict")!, title: "International District")
        let museumOfFlights = ImageData(image: UIImage(named: "museumOfFlights")!, title: "museum Of Flights")
        let pioneerSquare = ImageData(image: UIImage(named: "PioneerSquare")!, title: "Pioneer Square")
        let sculpturePark = ImageData(image: UIImage(named: "SculpturePark")!, title: "Sculpture Park")
        let spaceNeedle = ImageData(image: UIImage(named: "SpaceNeedle")!, title: "Space Needle")
        let volunteerPark = ImageData(image: UIImage(named: "VolunteerPark")!, title: "Volunteer Park")
        
        arr.append(ballardLocks)
        arr.append(computersMuseum)
        arr.append(discoveryPark)
        arr.append(glassGarden)
        arr.append(internationalDistrict)
        arr.append(museumOfFlights)
        arr.append(pioneerSquare)
        arr.append(sculpturePark)
        arr.append(spaceNeedle)
        arr.append(volunteerPark)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imageCell.image = arr[indexPath.row].image
        cell.imageLabel.text = arr[indexPath.row].title
        
        return cell
    }
    
}

