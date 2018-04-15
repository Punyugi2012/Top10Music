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
        numberLabel.text = String(musicVideo.number)
        nameLabel.text = musicVideo.name
        videoImage.image = UIImage(named: "nopic")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
