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
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are \(location.longitude), \(location.latitude)")
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
