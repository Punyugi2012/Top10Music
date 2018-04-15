//
//  MusicVideo.swift
//  Top10Music
//
//  Created by punyawee  on 15/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import Foundation
import UIKit

class MusicVideo {
    private var number: Int
    private var name: String
    private var urlImage: String
    private var urlVideo: String
    private var videoImage: UIImage!
    
    var Number: Int {
        get {
            return self.number
        }
    }
    var Name: String {
        get {
            return self.name
        }
    }
    var UrlImage: String {
        get {
            return self.urlImage
        }
    }
    var UrlVideo: String {
        get {
            return self.urlVideo
        }
    }
    var VideoImage: UIImage! {
        set (newValue) {
            self.videoImage = newValue
        }
        get {
            return self.videoImage
        }
    }
   
    init(_ number: Int, _ name: String, _ urlImage: String, _ urlVideo: String) {
        self.number = number
        self.name = name
        self.urlImage = urlImage
        self.urlVideo = urlVideo
        self.videoImage = nil
    }
}
