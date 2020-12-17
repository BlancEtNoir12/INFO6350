//
//  ViewController.swift
//  Lyric
//
//  Created by Terry on 12/17/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    var lyricString : String = "1"
    let apiUrl = "https://api.lyrics.ovh/v1/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is LyricViewController){
            let vc = segue.destination as! LyricViewController
            vc.lyric = lyricString
        }
    }

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtArtist: UITextField!
    
    @IBAction func getLyric(_ sender: Any) {
        guard let title = txtTitle.text else { return }
        guard let artist = txtArtist.text else { return }
        let url = URL(string: "\(apiUrl)\(artist)/\(title)".replacingOccurrences(of: " ", with: "%20"))!
        
        SwiftSpinner.show("Getting Lyric for \(title)")
        AF.request(url).responseJSON{ response in
            SwiftSpinner.hide()
            if response.error != nil {
                let alertController = UIAlertController(title: "Something wrong...", message:"Check your spell and try again", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Try again", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
            
            let lyricJSON :JSON = JSON(response.data!)
            guard let fullLyric = lyricJSON["lyrics"].rawString() else { return }
            self.lyricString = fullLyric
            
            self.performSegue(withIdentifier: "lyricSegue", sender: self)
            self.txtTitle.text = ""
            self.txtArtist.text = ""
        }
    }
    
}

