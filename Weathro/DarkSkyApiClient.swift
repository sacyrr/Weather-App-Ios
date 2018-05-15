//
//  DarkSkyApiClient.swift
//  Weathro
//
//  Created by Sachin on 08/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import Foundation
class DarkSkyApiClient
{
    fileprivate let apiKey = "c2ad76bd4822e4b822541a019ce89df5"
    lazy var baseUrl : URL = {
    return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    let downloader = JsonDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?,DarkSkyError?)->Void
    func getCurrentWeather(at coordinate:LocationCoordinate, completionHandler completion : @escaping CurrentWeatherCompletionHandler)
    {
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else
        {
            completion(nil,.invalidUrl)
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.JsonTask(with: request){json,error in
            DispatchQueue.main.async {
                guard let json = json else{
                    completion(nil,error)
                    return
                }
                guard let currentWeatherJson = json["currently"] as? [String:AnyObject], let currentWeather = CurrentWeather(json:currentWeatherJson) else{
                    completion(nil,.jsonParsingFailure)
                    return
                }
                completion(currentWeather,nil)
            }
           
        }
        task.resume()
    }
}
