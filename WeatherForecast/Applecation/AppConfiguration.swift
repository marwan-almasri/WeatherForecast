//
//  AppConfiguration.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

final class AppConfiguration {
    
    /// A `Unit` object contains the current user measurement unit in the system.
    /// - Note: this object is saved and returned directly in and from `UserDefaults`.
    public var unit: Unit {
        get {
            if let value = UserDefaults.standard.object(forKey: "USER-UNIT") as? String {
                return Unit(rawValue: value) ?? .metric
            } else {
                UserDefaults.standard.set(Unit.metric.rawValue, forKey: "USER-UNIT")
                return .metric
            }
        }
        set(newValue) {
            UserDefaults.standard.set(newValue.rawValue, forKey: "USER-UNIT")
        }
    }
}
