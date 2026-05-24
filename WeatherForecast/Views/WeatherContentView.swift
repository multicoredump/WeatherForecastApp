//
//  WeatherContentView.swift
//  WeatherForecast
//
//  Created by Radhika Karandikar on 5/23/26.
//

import SwiftUI
import CoreLocation

struct WeatherContentView: View {
    
    @Environment(LocationManager.self) private var locationManager
    
    var weatherManager = WeatherManager()
    @State private var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                    }
                }
                
                
                //Text("Your coordinates are \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                }
            }
            
            
        }
        .background(Color.navyBlue)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherContentView().environment(LocationManager())
}
