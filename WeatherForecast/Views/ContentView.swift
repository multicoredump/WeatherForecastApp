//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Radhika Karandikar on 5/21/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        WeekForecastView(startDate: "May 11", endDate:"May 18")
        
        ScrollView(.horizontal) {
            HStack {
                DayForecastView(day: "Mon", high: 33, low: 12, isRainy: false)
                DayForecastView(day: "Tue", high: 12, low: 5, isRainy: true)
                DayForecastView(day: "Wed", high: 33, low: 12, isRainy: false)
                DayForecastView(day: "Thur", high: 12, low: 5, isRainy: true)
                DayForecastView(day: "Fri", high: 33, low: 12, isRainy: false)
                DayForecastView(day: "Sat", high: 12, low: 5, isRainy: true)
                DayForecastView(day: "Sun", high: 33, low: 12, isRainy: false)
            }
        }
    }
}

struct DayForecastView: View {
    
    let day: String
    let high: Int
    let low: Int
    let isRainy :Bool
    
    // Use computed properties for the icon and color
    var iconName: String {
        isRainy ? "cloud.rain.fill" : "sun.max.fill"
    }
    
    var iconColor: Color {
        isRainy ? Color.blue : Color.yellow
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.title2)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }.padding()
    }
}

struct WeekForecastView : View {
    
    let startDate: String
    let endDate: String
    
    var body: some View {
        VStack{
            Text(startDate + " -> " + endDate)
                .font(Font.title)
        }
    }
}

#Preview {
    ContentView()
}
