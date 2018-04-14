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
    
    func callAPI(_ urlString: String, callBack: @escaping (_ result: String) -> Void) {
        let url = URL(string: urlString)
        let sessionConfig = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: url!) {(data: Data?, URLResponse: URLResponse?,error: Error?) in
            if error != nil {
                DispatchQueue.main.async(execute: {
                    callBack("Call API Fail!!")
                })
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
                            for result in results {
                                var music = result as? [String:Any]
                                if let name = music?["name"] as? String {
                                    print(name)
                                }
                                if let image = music?["artworkUrl100"] as? String {
                                    print(image)
                                }
                                if let url = music?["url"] as? String {
                                    print(url)
                                }
                                print("")
                            }
                        }
                    }
                    catch {
                        DispatchQueue.main.async(execute: {
                            callBack("JSON Serialization Error!!")
                        })
                    }
                }
                else {
                    DispatchQueue.main.async(execute: {
                        callBack("Call API Error!!")
                    })
                }
            }
        }
        task.resume()
    }
}
