//
//  CurrentCondition.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

public struct Condition {
    public var feelsLikeC: String?
    public var feelsLikeF: String?
    public var cloudcover: String?
    public var humidity: String?
    public var localObsDateTime: String?
    public var observationTime: String?
    public var precipInches: String?
    public var precipMM: String?
    public var pressure: String?
    public var pressureInches: String?
    public var tempC: String?
    public var tempF: String?
    public var uvIndex: String?
    public var visibility: String?
    public var visibilityMiles: String?
    public var weatherCode: String?
    public var weatherDesc: [Description]?
    public var weatherIconURL: [Description]?
    public var winddir16Point: String?
    public var winddirDegree: String?
    public var windspeedKmph: String?
    public var windspeedMiles: String?

    public init(feelsLikeC: String?,
                feelsLikeF: String?,
                cloudcover: String?,
                humidity: String?,
                localObsDateTime: String?,
                observationTime: String?,
                precipInches: String?,
                precipMM: String?,
                pressure: String?,
                pressureInches: String?,
                tempC: String?,
                tempF: String?,
                uvIndex: String?,
                visibility: String?,
                visibilityMiles: String?,
                weatherCode: String?,
                weatherDesc: [Description]?,
                weatherIconURL: [Description]?,
                winddir16Point: String?,
                winddirDegree: String?,
                windspeedKmph: String?,
                windspeedMiles: String?) {
        self.feelsLikeC = feelsLikeC
        self.feelsLikeF = feelsLikeF
        self.cloudcover = cloudcover
        self.humidity = humidity
        self.localObsDateTime = localObsDateTime
        self.observationTime = observationTime
        self.precipInches = precipInches
        self.precipMM = precipMM
        self.pressure = pressure
        self.pressureInches = pressureInches
        self.tempC = tempC
        self.tempF = tempF
        self.uvIndex = uvIndex
        self.visibility = visibility
        self.visibilityMiles = visibilityMiles
        self.weatherCode = weatherCode
        self.weatherDesc = weatherDesc
        self.weatherIconURL = weatherIconURL
        self.winddir16Point = winddir16Point
        self.winddirDegree = winddirDegree
        self.windspeedKmph = windspeedKmph
        self.windspeedMiles = windspeedMiles
    }
}
