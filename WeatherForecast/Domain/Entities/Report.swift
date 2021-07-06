//
//  Report.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

public struct Report {
    public var currentCondition: [Condition]?
    public var nearestArea: [Area]?
    public var request: [Request]?
    public var weather: [Weather]?

    public init(currentCondition: [Condition]?,
                nearestArea: [Area]?,
                request: [Request]?,
                weather: [Weather]?) {
        self.currentCondition = currentCondition
        self.nearestArea = nearestArea
        self.request = request
        self.weather = weather
    }
}
