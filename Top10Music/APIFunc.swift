//
//  APIFunc.swift
//  Top10Music
//
//  Created by punyawee  on 13/4/61.
//  Copyright © พ.ศ. 2561 punyawee . All rights reserved.
//

import Foundation

//class สำหรับเรียกใช้ API เพื่อขอข้อมูล Music Video
class APIFunc {
    
    func callAPI(_ urlString: String, callBack: @escaping (_ musicVideos: [MusicVideo]) -> Void) {
        let url = URL(string: urlString)
        let sessionConfig = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: url!) {(data: Data?, URLResponse: URLResponse?,error: Error?) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                if let resultData = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: resultData, options: .allowFragments)
                        if
                            let object = jsonObject as? [String:Any],
                            let feed = object["feed"] as? [String:Any],
                            let results = feed["results"] as? [Any]
                        {
                            var number: Int = 0
                            var nameVideo: String = ""
                            var urlImage: String = ""
                            var urlVideo: String = ""
                            var musicVideos: [MusicVideo] = []
                            for result in results {
                                var music = result as? [String:Any]
                                number += 1
                                if let name = music?["name"] as? String {
                                    nameVideo = name
                                }
                                else {
                                    nameVideo = ""
                                }
                                if let image = music?["artworkUrl100"] as? String {
                                    urlImage = image.replacingOccurrences(of: "200x200", with: "500x500")
                                }
                                else {
                                    urlImage = ""
                                }
                                if let url = music?["url"] as? String {
                                    urlVideo = url
                                }
                                else {
                                    urlVideo = ""
                                }
                                musicVideos.append(MusicVideo(number, nameVideo, urlImage, urlVideo))
                            }
                            DispatchQueue.main.async(execute: {
                                callBack(musicVideos)
                            })
                        }
                    }
                    catch {
                        print("JSON Serialization Error!!")
                    }
                }
                else {
                        print("Call API Error!!")
                }
            }
        }
        task.resume()
    }
}
