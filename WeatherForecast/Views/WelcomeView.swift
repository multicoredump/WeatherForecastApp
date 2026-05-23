//
//  WelcomeView.swift
//  WeatherForecast
//
//  Created by Radhika Karandikar on 5/23/26.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @Environment(LocationManager.self) private var locationManager
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Welcome to Weather App")
                    .font(.title.bold())
                Text("Please share your current location to get the latest weather")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView().environment(LocationManager())
}
