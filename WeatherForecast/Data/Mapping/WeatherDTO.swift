//
//  WeatherDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

// MARK: - Weather
public struct WeatherDTO {
    public var astronomy: [AstronomyDTO]?
    public var avgtempC: String?
    public var avgtempF: String?
    public var date: String?
    public var hourly: [HourlyDTO]?
    public var maxtempC: String?
    public var maxtempF: String?
    public var mintempC: String?
    public var mintempF: String?
    public var sunHour: String?
    public var totalSnowCM: String?
    public var uvIndex: String?

    public init(astronomy: [AstronomyDTO]?,
                avgtempC: String?,
                avgtempF: String?,
                date: String?,
                hourly: [HourlyDTO]?,
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

extension WeatherDTO {
    func toDomain() -> Weather {
        return Weather(astronomy: astronomy?.map { $0.toDomain() },
                        avgtempC: avgtempC,
                        avgtempF: avgtempF,
                        date: date,
                        hourly: hourly?.map { $0.toDomain() },
                        maxtempC: maxtempC,
                        maxtempF: maxtempF,
                        mintempC: mintempC,
                        mintempF: mintempF,
                        sunHour: sunHour,
                        totalSnowCM: totalSnowCM,
                        uvIndex: uvIndex)
    }
}

extension WeatherDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case astronomy = "astronomy"
        case avgtempC = "avgtempC"
        case avgtempF = "avgtempF"
        case date = "date"
        case hourly = "hourly"
        case maxtempC = "maxtempC"
        case maxtempF = "maxtempF"
        case mintempC = "mintempC"
        case mintempF = "mintempF"
        case sunHour = "sunHour"
        case totalSnowCM = "totalSnow_cm"
        case uvIndex = "uvIndex"
    }
}

// MARK: Weather convenience initializers and mutators

public extension WeatherDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(WeatherDTO.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        astronomy: [AstronomyDTO]?? = nil,
        avgtempC: String?? = nil,
        avgtempF: String?? = nil,
        date: String?? = nil,
        hourly: [HourlyDTO]?? = nil,
        maxtempC: String?? = nil,
        maxtempF: String?? = nil,
        mintempC: String?? = nil,
        mintempF: String?? = nil,
        sunHour: String?? = nil,
        totalSnowCM: String?? = nil,
        uvIndex: String?? = nil
    ) -> WeatherDTO {
        return WeatherDTO(
            astronomy: astronomy ?? self.astronomy,
            avgtempC: avgtempC ?? self.avgtempC,
            avgtempF: avgtempF ?? self.avgtempF,
            date: date ?? self.date,
            hourly: hourly ?? self.hourly,
            maxtempC: maxtempC ?? self.maxtempC,
            maxtempF: maxtempF ?? self.maxtempF,
            mintempC: mintempC ?? self.mintempC,
            mintempF: mintempF ?? self.mintempF,
            sunHour: sunHour ?? self.sunHour,
            totalSnowCM: totalSnowCM ?? self.totalSnowCM,
            uvIndex: uvIndex ?? self.uvIndex
        )
    }

    func jsonData() throws -> Data {
        return try JSONSchemaSupport.encoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
