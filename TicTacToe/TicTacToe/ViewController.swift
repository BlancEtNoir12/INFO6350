//
//  ViewController.swift
//  TicTacToe
//
//  Created by admin on 10/2/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblTurn: UILabel!
    
    var arrButtons: [UIButton]?
    
    var buttonValue = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
    
    var turn = true // X = true
    
    let winningCombinations = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    
    func initialize() {
        arrButtons = [zero, one, two, three, four, five, six, seven, eight]
        for button in arrButtons! {
            button.setTitle("", for: .normal)
        }
        buttonValue = [-1, -1, -1, -1, -1, -1, -1, -1, -1]
        lblResult.text = ""
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let id = sender.tag
        
        if buttonValue[id] != -1 {
            return
        }
        
        guard let arrButtons = arrButtons else { return }
        if turn == true {
            arrButtons[sender.tag].setTitle("X", for: .normal)
            lblTurn.text = "O's Turn"
            buttonValue[id] = 0
        }else {
            arrButtons[sender.tag].setTitle("O", for: .normal)
            lblTurn.text = "X's Turn"
            buttonValue[id] = 1
        }
        
        for combination in winningCombinations {
            if (
                buttonValue[combination[0]] == buttonValue[combination[1]] &&
                buttonValue[combination[1]] == buttonValue[combination[2]] &&
                buttonValue[combination[0]] != -1
            ) {
                lblResult.text = "!!!!!!!!!!!!"
                if turn == true {
                    lblTurn.text = "X Won"
                }else {
                    lblTurn.text = "O Won"
                }
            }
        }
        
        
        turn = !turn
    }
    
}

