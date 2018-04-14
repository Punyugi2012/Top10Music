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
                        print("\n\n\n\n\n\(jsonObject)\n\n\n\n\n")
                        DispatchQueue.main.async(execute: {
                            callBack("Call API Successful!!")
                        })
                    }
                    catch {
                        DispatchQueue.main.async(execute: {
                            callBack("Call API Fail!!")
                        })
                    }
                }
            }
        }
        task.resume()
    }
}
