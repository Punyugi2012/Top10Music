//
//  MusicTableViewCell.swift
//  Top10Music
//
//  Created by punyawee  on 15/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setValue(_ musicVideo: MusicVideo) {
        numberLabel.text = "อันดับที่ \(musicVideo.Number)"
        nameLabel.text = musicVideo.Name
        if musicVideo.VideoImage != nil {
            videoImage.image = musicVideo.VideoImage
        }
        else {
            setImage(musicVideo)
        }
    }
    func setImage(_ musicVideo: MusicVideo) {
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: URL(string: musicVideo.UrlImage)!) {
                musicVideo.VideoImage = UIImage(data: data)!
                DispatchQueue.main.async {
                    self.videoImage.image = musicVideo.VideoImage
                }
            }
            else {
                DispatchQueue.main.async {
                    self.videoImage.image = UIImage(named: "nopic")
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
