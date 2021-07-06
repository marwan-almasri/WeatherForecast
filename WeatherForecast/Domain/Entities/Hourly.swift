//
//  Hourly.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

public struct Hourly {
    public var dewPointC: String?
    public var dewPointF: String?
    public var feelsLikeC: String?
    public var feelsLikeF: String?
    public var heatIndexC: String?
    public var heatIndexF: String?
    public var windChillC: String?
    public var windChillF: String?
    public var windGustKmph: String?
    public var windGustMiles: String?
    public var chanceoffog: String?
    public var chanceoffrost: String?
    public var chanceofhightemp: String?
    public var chanceofovercast: String?
    public var chanceofrain: String?
    public var chanceofremdry: String?
    public var chanceofsnow: String?
    public var chanceofsunshine: String?
    public var chanceofthunder: String?
    public var chanceofwindy: String?
    public var cloudcover: String?
    public var humidity: String?
    public var precipInches: String?
    public var precipMM: String?
    public var pressure: String?
    public var pressureInches: String?
    public var tempC: String?
    public var tempF: String?
    public var time: String?
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

    public init(dewPointC: String?,
                dewPointF: String?,
                feelsLikeC: String?,
                feelsLikeF: String?,
                heatIndexC: String?,
                heatIndexF: String?,
                windChillC: String?,
                windChillF: String?,
                windGustKmph: String?,
                windGustMiles: String?,
                chanceoffog: String?,
                chanceoffrost: String?,
                chanceofhightemp: String?,
                chanceofovercast: String?,
                chanceofrain: String?,
                chanceofremdry: String?,
                chanceofsnow: String?,
                chanceofsunshine: String?,
                chanceofthunder: String?,
                chanceofwindy: String?,
                cloudcover: String?,
                humidity: String?,
                precipInches: String?,
                precipMM: String?,
                pressure: String?,
                pressureInches: String?,
                tempC: String?,
                tempF: String?,
                time: String?,
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
        self.dewPointC = dewPointC
        self.dewPointF = dewPointF
        self.feelsLikeC = feelsLikeC
        self.feelsLikeF = feelsLikeF
        self.heatIndexC = heatIndexC
        self.heatIndexF = heatIndexF
        self.windChillC = windChillC
        self.windChillF = windChillF
        self.windGustKmph = windGustKmph
        self.windGustMiles = windGustMiles
        self.chanceoffog = chanceoffog
        self.chanceoffrost = chanceoffrost
        self.chanceofhightemp = chanceofhightemp
        self.chanceofovercast = chanceofovercast
        self.chanceofrain = chanceofrain
        self.chanceofremdry = chanceofremdry
        self.chanceofsnow = chanceofsnow
        self.chanceofsunshine = chanceofsunshine
        self.chanceofthunder = chanceofthunder
        self.chanceofwindy = chanceofwindy
        self.cloudcover = cloudcover
        self.humidity = humidity
        self.precipInches = precipInches
        self.precipMM = precipMM
        self.pressure = pressure
        self.pressureInches = pressureInches
        self.tempC = tempC
        self.tempF = tempF
        self.time = time
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
