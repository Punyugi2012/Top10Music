//
//  MusicDetailViewController.swift
//  Top10Music
//
//  Created by punyawee  on 16/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import UIKit
import AVKit

class MusicDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    var musicVideo: MusicVideo!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = musicVideo.Name
        if musicVideo.VideoImage != nil {
            videoImage.image = musicVideo.VideoImage
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func playMusicVideo(sender: Any) {
        if Reachability.isConnectNetwork() {
            if let urlVideo = URL(string: musicVideo.UrlVideo) {
                let player = AVPlayer(url: urlVideo)
                let playerController = AVPlayerViewController()
                playerController.player = player
                present(playerController, animated: true, completion: {
                    player.play()
                })
            }
        }
        else {
            let alertController = UIAlertController(title: "Connected Failed", message: "คุณไม่ได้เชื่อมต่อ internet", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
