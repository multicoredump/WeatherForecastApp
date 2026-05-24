//
//  Extensions.swift
//  WeatherForecast
//
//  Created by Radhika Karandikar on 5/23/26.
//

import Foundation
import SwiftUI

// Extension for rounded Double to 0 decimals
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

