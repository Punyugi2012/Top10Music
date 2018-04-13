//
//  ViewController.swift
//  Top10Music
//
//  Created by punyawee  on 13/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = APIFunc()
        //เรียกใช้งาน API เมื่อทำงานเสร็จก็จะเรียก function FinishedCallAPI
        api.callAPI("https://rss.itunes.apple.com/api/v1/th/music-videos/top-music-videos/all/10/non-explicit.json", callBack: finishedCallAPI)
    }
    
    func finishedCallAPI(result: String) {
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

