//
//  Area.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

public struct Area {
    public var areaName: [Description]?
    public var country: [Description]?
    public var latitude: String?
    public var longitude: String?
    public var population: String?
    public var region: [Description]?
    public var weatherURL: [Description]?

    public init(areaName: [Description]?,
                country: [Description]?,
                latitude: String?,
                longitude: String?,
                population: String?,
                region: [Description]?,
                weatherURL: [Description]?) {
        self.areaName = areaName
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.population = population
        self.region = region
        self.weatherURL = weatherURL
    }
}
