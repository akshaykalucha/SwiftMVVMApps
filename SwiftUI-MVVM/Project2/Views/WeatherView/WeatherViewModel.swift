//
//  WeatherViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 23/02/22.
//

import SwiftUI
import MapKit
import CoreLocation


class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    
    static let shared = LocationManager()
    
    override init(){
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("DEBUG")
        case .restricted:
            print("Debuf")
            
        case .denied:
            print("FVHG")
        case .authorizedAlways:
            print("hgjk")
        case .authorizedWhenInUse:
            print("GHJB")
        @unknown default:
            break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}

class LocationHelper: NSObject, ObservableObject {

    static let shared = LocationHelper()
    static let DefaultLocation = CLLocationCoordinate2D(latitude: 45.8827419, longitude: -1.1932383)

    static var currentLocation: CLLocationCoordinate2D {
        guard let location = shared.locationManager.location else {
            return DefaultLocation
        }
        return location.coordinate
    }

    private let locationManager = CLLocationManager()

    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationHelper: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Location manager changed the status: \(status)")
    }
}



let apiKey = "a25ffc3abde70c25f3d7f331151a9e3f"

class WeatherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var descriptionText: String = ""
    @Published var temp: String = ""
    @Published var timezone: String = ""
    @Published var isLoading: Bool = false
    
    private var region: MKCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
            span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom))
    private enum MapDefaults {
        static let latitude = 45.872
        static let longitude = -1.248
        static let zoom = 0.5
    }
    
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        isLoading = true
        let location = LocationManager.shared.userLocation?.coordinate
        print("\(location?.latitude) \(location?.longitude) this is the initial print of view")
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,daily,minutely&lat=\(location?.latitude ?? 28.7041)&&lon=\(location?.longitude ?? 77.1025)&units=imperial&appid=a25ffc3abde70c25f3d7f331151a9e3f") else {
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
