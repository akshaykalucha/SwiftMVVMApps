//
//  WeatherViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 23/02/22.
//

import SwiftUI
import MapKit
import CoreLocation


let apiKey = "a25ffc3abde70c25f3d7f331151a9e3f"

extension CLLocationManager {
    
    func checkLocationPermission() {
        
        if self.authorizationStatus != .authorizedWhenInUse && self.authorizationStatus != .authorizedAlways {
            
            self.requestAlwaysAuthorization()
            
        }
        
    }
    
}

var locationManager = CLLocationManager()


class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    override init() {
        super.init()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

class WeatherViewModel: ObservableObject {
    private var longitude: String = ""
    private var latitude: String = ""
    @Published var title: String = ""
    @Published var descriptionText: String = ""
    @Published var temp: String = ""
    @Published var timezone: String = ""
    @Published var isLoading: Bool = false
    
    init() {
        fetchWeather()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
            self.longitude =  String(currentLoc.coordinate.latitude)
            self.latitude = String(currentLoc.coordinate.longitude)
        }
    }
    
    func fetchWeather() {
        isLoading = true
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,daily,minutely&lat=\(self.latitude)&&lon=\(self.longitude)&units=imperial&appid=a25ffc3abde70c25f3d7f331151a9e3f") else {
            return
        }
        let task = URLSession.shared.dataTask(with:url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Populate the model
            
            do {
                let model = try JSONDecoder().decode(weatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temp = "\(model.current.temp)"
                    self.timezone = model.timezone
                }
            }
            catch{
                print("error")
            }
            
        }
        task.resume()
    }
    
}
