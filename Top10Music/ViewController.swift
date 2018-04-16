//
//  ViewController.swift
//  Top10Music
//
//  Created by punyawee  on 13/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!
    var sliderValue: Int = 2
    @IBAction func sliderValueChanged(_ sender: Any) {
        sliderValue = Int(slider.value)
        sliderValueLabel.text = String(sliderValue)
    }
    var musicVideos: [MusicVideo] = []
    
    @IBAction func seachTouched(_ sender: AnyObject) {
        if Reachability.isConnectNetwork() {
            let api = APIFunc()
            api.callAPI("https://rss.itunes.apple.com/api/v1/th/music-videos/top-music-videos/all/\(sliderValue)/non-explicit.json", callBack: finishedCallAPI)
            statusLabel.text = "internet connection ok"
            statusLabel.backgroundColor = UIColor.green
        }
        else {
            let alertController = UIAlertController(title: "Connected Failed", message: "คุณไม่ได้เชื่อมต่อ internet", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            statusLabel.text = "internet connection fail"
            statusLabel.backgroundColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = ""
        slider.value = Float(sliderValue)
        sliderValueLabel.text = String(sliderValue)
    }
    
    func finishedCallAPI(_ musicVideos: [MusicVideo]) {
        self.musicVideos = musicVideos
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicVideos.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! MusicTableViewCell
        if Reachability.isConnectNetwork() {
            cell.setValue(musicVideos[indexPath.row])
            statusLabel.text = "internet connection ok"
            statusLabel.backgroundColor = UIColor.green
        }
        else {
            statusLabel.text = "internet connection fail"
            statusLabel.backgroundColor = UIColor.red
        }
        return cell
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MusicDetail" {
            if let detailPage = segue.destination as? MusicDetailViewController {
                if let IndexPath = tableView.indexPathForSelectedRow {
                    let musicVideo = musicVideos[IndexPath.row]
                    detailPage.musicVideo = musicVideo
                }
            }
        }
    }


}

