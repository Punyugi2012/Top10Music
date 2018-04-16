//
//  MusicDetailViewController.swift
//  Top10Music
//
//  Created by punyawee  on 16/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import UIKit

class MusicDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    var musicVideo: MusicVideo!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = musicVideo.Name
        if musicVideo.VideoImage != nil {
            videoImage.image = musicVideo.VideoImage
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
