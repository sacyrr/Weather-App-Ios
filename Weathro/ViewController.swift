//
//  ViewController.swift
//  Weathro
//
//  Created by Sachin on 07/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
public var lat:Double = 0.0
public var lon:Double = 0.0
class ViewController: UIViewController , CLLocationManagerDelegate{
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconLabel: UIImageView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var probabilityPrecisionLabel: UILabel!
    @IBOutlet weak var probabilityTypeLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var ozoneLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
   // fileprivate let darkSkyApiKey = "c2ad76bd4822e4b822541a019ce89df5"
    
    var locationManager:CLLocationManager!
    let client = DarkSkyApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let currentWeather = CurrentWeather(temp: 35, humidity: 1, pressure: 1.3, visibility: 0.77, ozone: 9, windSpeed: 5.678, summary: "Today is so hot", icon: "rainy", precisionType: "sunny", precisonProbability: 2.34)
//        let currentweatherViewModel = CurrentWatherViewModel(model: currentWeather)
//        showWeather(using: currentweatherViewModel)
//
//        let base = URL(string:"https://api.darksky.net/forecast/\(darkSkyApiKey)/")
//         let weatherUrl = URL(fileURLWithPath: "37.8267,-122.4233", relativeTo: base)
//
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//
//        let request = URLRequest(url: weatherUrl)
//
//        let DataTask = session.dataTask(with: request){data, response, error in
//            print(data!)
//        }
//        DataTask.resume()
////        IT IS SYNCHRONOUS DATA FETCHING AND THIS APPROCH BLOCKS UI THREAD
////        let weatherData = try! Data(contentsOf: weatherUrl)
////        print(weatherData)
////
////        print("NSData is gives data in hexadecimal format")
////        print(weatherData as NSData)
////
////        let json = try! JSONSerialization.jsonObject(with: weatherData, options:[])
////        print(json)
        getRefreshedWeather()
        
       
   
    }
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        lat = userLocation.coordinate.latitude
        lon = userLocation.coordinate.longitude
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getRefreshedWeather() {
        determineMyCurrentLocation()
        toggleRefreshedAnimation(on: true)
        let coordinate = LocationCoordinate(latitude: lat, longitude: lon)
        
        client.getCurrentWeather(at: coordinate){[unowned self]currentWeather,error in
            if let currentWeather = currentWeather {
                let viewmodel = CurrentWatherViewModel(model: currentWeather)
                self.showWeather(using: viewmodel)
                self.toggleRefreshedAnimation(on: false)
            }
            
        }
    }
    
    func showWeather(using viewmodel:CurrentWatherViewModel)
    {
        tempLabel.text = viewmodel.temp
        iconLabel.image = viewmodel.icon
        summaryLabel.text = viewmodel.summary
        pressureLabel.text = viewmodel.pressure
        probabilityPrecisionLabel.text = viewmodel.precisionProbability
       // probabilityTypeLabel.text = viewmodel.precisionType
        windSpeedLabel.text = viewmodel.windspeed
        ozoneLabel.text = viewmodel.ozone
        humidityLabel.text = viewmodel.humidity
        visibilityLabel.text = viewmodel.visibility
    }
    func toggleRefreshedAnimation(on : Bool)
    {
        refreshButton.isHidden = on
        if on{
            activityIndicator.startAnimating()
        }else{
            activityIndicator.stopAnimating()
        }
    }

}

