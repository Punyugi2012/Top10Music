//
//  MusicVideo.swift
//  Top10Music
//
//  Created by punyawee  on 15/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import Foundation

class MusicVideo {
    var number: Int
    var name: String
    var urlImage: String
    var urlVideo: String
    init(_ number: Int, _ name: String, _ urlImage: String, _ urlVideo: String) {
        self.number = number
        self.name = name
        self.urlImage = urlImage
        self.urlVideo = urlVideo
    }
}
