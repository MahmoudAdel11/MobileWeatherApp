//
//  WeatherViewModel.swift
//  Mobile Weather App
//
//  Created by Mahmoud on 17/09/2023.
//

import Foundation
import SwiftUI
import CoreLocation

final class WeatherViewModel: NSObject , ObservableObject {
    @Published var weather = WeatherResponse.call()
    
    @Published var city = Constants.Strings.city {
        didSet {
            getLocation()
        }
    }

//    init() {
//        getLocation()
//    }
//
    //............................................................................................................................................
    private let locationManager = CLLocationManager()

    public override init() {
      super.init()
      locationManager.delegate = self
        getLocation()
    }
    public func loadWeatherData(
      _ completionHandler: @escaping((WeatherResponse?, LocationAuthError?) -> Void)
    ) {
      self.completionHandler = completionHandler
      loadDataOrRequestLocationAuth()
    }
    //............................................................................................................................................
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks,
               let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    //............................................................................................................................................
    private var completionHandler: ((WeatherResponse?, LocationAuthError?) -> Void)?
    //............................................................................................................................................

    
    private func loadDataOrRequestLocationAuth() {
      switch locationManager.authorizationStatus {
      case .authorizedAlways, .authorizedWhenInUse:
        locationManager.startUpdatingLocation()
      case .denied, .restricted:
        completionHandler?(nil, LocationAuthError())
      default:
        locationManager.requestWhenInUseAuthorization()
      }
    }
    private func getWeather(coord: CLLocationCoordinate2D?) {
        var urlString = ""
        if let coord = coord {
            urlString = WeatherApi.getCurrentWeatherURL(latitude: coord.latitude, longitude: coord.longitude)
        } else {
            urlString = WeatherApi.getCurrentWeatherURL(latitude: 53.9, longitude: 27.5667) // Minsk
        }
        getWeatherInternal(city: city, for: urlString)
    }

    private func getWeatherInternal(city: String, for urlString: String) {
        guard let url = URL(string: urlString) else {return}
        NetworkManager<WeatherResponse>.fetchWeather(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
//    var date: String {
//        return Time.defaultDateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.date)) )
//    }

//    var weatherIcon: String {
//        return weather.TheWeather
//    }
//    var TheCitydes: String {
//        return weather.TheWeather.description
//    }
    var TheCityName: String {
        return weather.name
    }
    var temperature: String {
        return getTempFor(weather.main.temp)
    }

    var Maxtemperature: String {
        return getTempFor(weather.main.tempMax)
    }
    var Mintemperature: String {
        return getTempFor(weather.main.tempMin)
    }



    func getTempFor(_ temp: Double) -> String {
        return String(format: "%1.0f", temp)
    }
}
//..........

extension WeatherViewModel: CLLocationManagerDelegate {
  public func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    guard let location = locations.first else { return }
//      let aqa = location.coordinate
      getWeather(coord: location.coordinate)
  }

  public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    loadDataOrRequestLocationAuth()
  }
  public func locationManager(
    _ manager: CLLocationManager,
    didFailWithError error: Error
  ) {
    print("Something went wrong: \(error.localizedDescription)")
  }
}
//....
