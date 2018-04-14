//
//  ViewController.swift
//  Top10Music
//
//  Created by punyawee  on 13/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func seachTouched(_ sender: AnyObject) {
        if Reachability.isConnectNetwork() {
            let api = APIFunc()
            api.callAPI("https://rss.itunes.apple.com/api/v1/th/music-videos/top-music-videos/all/10/non-explicit.json", callBack: finishedCallAPI)
            statusLabel.text = "internet connected"
            statusLabel.backgroundColor = UIColor.green
        }
        else {
            let alertController = UIAlertController(title: "Connected Failed", message: "คุณไม่ได้เชื่อมต่อ internet", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            statusLabel.text = "internet failed"
            statusLabel.backgroundColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = ""
    }
    
    func finishedCallAPI(result: String) {
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

