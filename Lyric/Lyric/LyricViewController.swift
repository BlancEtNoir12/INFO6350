//
//  LyricViewController.swift
//  Lyric
//
//  Created by admin on 12/17/20.
//

import UIKit

class LyricViewController: UIViewController {
    
    var lyric:String = " "
    
    @IBOutlet weak var txtLyric: UITextView!
    
    override func viewDidLoad() {
        slider.value = 18
        txtLyric.text = lyric
        super.viewDidLoad()
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func changeFontSize(_ sender: UISlider) {
        txtLyric.font = txtLyric.font!.withSize(CGFloat(slider.value))
    }
}
