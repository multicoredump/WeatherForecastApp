//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by Radhika Karandikar on 5/21/26.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    
    @State private var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            WeatherContentView().environment(locationManager)
        }
    }
}
