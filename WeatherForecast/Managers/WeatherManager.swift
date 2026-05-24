//
//  WeatherManager.swift
//  WeatherForecast
//
//  Created by Radhika Karandikar on 5/23/26.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    private let API_KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    
    //"https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&exclude={part}&appid=\(API_KEY)&units=metric")
    
    // "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=\(API_KEY)")
    
    /// // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)&units=metric")
        else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
        
        
    }
    
    
}

// Model of the response body we get from calling the OpenWeather One Call API 3.0
//struct ResponseBody: Decodable {
//    var lat: Double
//    var lon: Double
//    var timezone: String
//    var timezone_offset: Int
//    var current: CurrentWeather
//
//    struct CurrentWeather: Decodable {
//        var dt: Int
//        var sunrise: Int
//        var sunset: Int
//        var temp: Double
//        var feels_like: Double
//        var pressure: Int
//        var humidity: Int
//        var dew_point: Double
//        var uvi: Double
//        var clouds: Int
//        var visibility: Int
//        var wind_speed: Double
//        var wind_deg: Int
//        var wind_gust: Double?
//        var weather: [WeatherCondition]
//    }
//
//    struct WeatherCondition: Decodable {
//        var id: Int
//        var main: String
//        var description: String
//        var icon: String
//    }
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseBody = try? JSONDecoder().decode(ResponseBody.self, from: jsonData)

// MARK: - ResponseBody
struct ResponseBody: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
    
    struct Coord: Decodable {
        let lon, lat: Double
    }
    
    struct Clouds: Decodable {
        let all: Int
    }
    
    // MARK: - Main
    struct Main: Decodable {
        let temp, feelsLike, tempMin, tempMax: Double
        let pressure, humidity: Int

        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
        }
    }
    
    
    struct Sys: Decodable {
        let type, id: Int
        let country: String
        let sunrise, sunset: Int
    }
    
    // MARK: - Weather
    struct Weather: Decodable {
        let id: Int
        let main, description, icon: String
    }
    
    // MARK: - Wind

    struct Wind: Decodable {
        let speed: Double
        let deg: Int
        let gust: Double?
    }
}

//extension ResponseBody.CurrentWeather {
//    var feelsLike: Double { feels_like }
//    var dewPoint: Double { dew_point }
//    var windSpeed: Double { wind_speed }
//    var windDeg: Int { wind_deg }
//}




