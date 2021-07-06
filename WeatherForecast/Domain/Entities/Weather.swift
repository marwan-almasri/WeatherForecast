//
//  Weather.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

public struct Weather {
    public var astronomy: [Astronomy]?
    public var avgtempC: String?
    public var avgtempF: String?
    public var date: String?
    public var hourly: [Hourly]?
    public var maxtempC: String?
    public var maxtempF: String?
    public var mintempC: String?
    public var mintempF: String?
    public var sunHour: String?
    public var totalSnowCM: String?
    public var uvIndex: String?

    public init(astronomy: [Astronomy]?,
                avgtempC: String?,
                avgtempF: String?,
                date: String?,
                hourly: [Hourly]?,
                maxtempC: String?,
                maxtempF: String?,
                mintempC: String?,
                mintempF: String?,
                sunHour: String?,
                totalSnowCM: String?,
                uvIndex: String?) {
        self.astronomy = astronomy
        self.avgtempC = avgtempC
        self.avgtempF = avgtempF
        self.date = date
        self.hourly = hourly
        self.maxtempC = maxtempC
        self.maxtempF = maxtempF
        self.mintempC = mintempC
        self.mintempF = mintempF
        self.sunHour = sunHour
        self.totalSnowCM = totalSnowCM
        self.uvIndex = uvIndex
    }
}
