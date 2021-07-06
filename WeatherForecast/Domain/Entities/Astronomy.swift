//
//  Astronomy.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

// MARK: - Astronomy
public struct Astronomy {
    public var moonIllumination: String?
    public var moonPhase: String?
    public var moonrise: String?
    public var moonset: String?
    public var sunrise: String?
    public var sunset: String?

    public init(moonIllumination: String?,
                moonPhase: String?,
                moonrise: String?,
                moonset: String?,
                sunrise: String?,
                sunset: String?) {
        self.moonIllumination = moonIllumination
        self.moonPhase = moonPhase
        self.moonrise = moonrise
        self.moonset = moonset
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
