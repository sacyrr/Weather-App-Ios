//
//  JsonDownloader.swift
//  Weathro
//
//  Created by Sachin on 08/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import Foundation
class JsonDownloader
{
    let session : URLSession
    
    init(config : URLSessionConfiguration)
    {
        self.session = URLSession(configuration: config)
    }
    convenience init()
    {
        self.init(config: .default)
    }
    
    typealias JSON = [String:AnyObject]
    typealias JsonDownloaderCompletionHandler = (JSON?,DarkSkyError?)->Void
    func JsonTask(with request: URLRequest,completionHandler completion:@escaping JsonDownloaderCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) {data , response, error in
            
            //Convert to HTTPResponse
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil,.requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options:[]) as! [String:AnyObject]
                        completion(json,nil)
                    }catch{
                        completion(nil,.jsonConversionFailed)
                    }
                }else {
                    completion(nil,.invalidData)
                }
                
            } else {
                completion(nil,.responseUnsuccesful)
            }
        }
        return task
    }
}
