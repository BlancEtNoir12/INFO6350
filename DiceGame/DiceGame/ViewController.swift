//
//  ViewController.swift
//  DiceGame
//
//  Created by admin on 10/2/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1: UIImageView!
    
    @IBOutlet weak var dice2: UIImageView!
    
    @IBOutlet weak var lblScore: UILabel!
    
    var dice1Value = -1
    var dice2Value = -1
    var totalScore = 0
    
    let imageNames = ["One", "Two", "Three", "Four", "Five", "Six"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rollDices()
        updateScore()
    }

    func rollDices() {
        dice1Value = Int.random(in: 0..<6)
        dice2Value = Int.random(in: 0..<6)
        
        dice1.image = UIImage(named: imageNames[dice1Value])
        dice2.image = UIImage(named: imageNames[dice2Value])

    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        rollDices()
        totalScore = 0
        updateScore()
    }
    
    @IBAction func lessThan7Pressed(_ sender: UIButton) {
        rollDices()
        if dice1Value + dice2Value < 7 {
            totalScore += 1
        }
        updateScore()
    }
    
    @IBAction func equalTo7Pressed(_ sender: UIButton) {
        rollDices()
        if dice1Value + dice2Value == 7 {
            totalScore += 7
        }
        updateScore()
    }
    
    @IBAction func greaterThan7Pressed(_ sender: UIButton) {
        rollDices()
        if dice1Value + dice2Value > 7 {
            totalScore += 1
        }
        updateScore()
    }
    
    func updateScore() {
        lblScore.text = "Your Score = \(totalScore)"
    }
}

