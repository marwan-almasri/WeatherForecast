//
//  ConditionDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

// MARK: - ConditionDTO
public struct ConditionDTO {
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
    public var weatherDesc: [DescriptionDTO]?
    public var weatherIconURL: [DescriptionDTO]?
    public var winddir16Point: String?
    public var winddirDegree: String?
    public var windspeedKmph: String?
    public var windspeedMiles: String?

    public init(feelsLikeC: String?, feelsLikeF: String?, cloudcover: String?, humidity: String?, localObsDateTime: String?, observationTime: String?, precipInches: String?, precipMM: String?, pressure: String?, pressureInches: String?, tempC: String?, tempF: String?, uvIndex: String?, visibility: String?, visibilityMiles: String?, weatherCode: String?, weatherDesc: [DescriptionDTO]?, weatherIconURL: [DescriptionDTO]?, winddir16Point: String?, winddirDegree: String?, windspeedKmph: String?, windspeedMiles: String?) {
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

extension ConditionDTO {
    func toDomain() -> Condition {
        return Condition(feelsLikeC: feelsLikeC,
                        feelsLikeF: feelsLikeF,
                        cloudcover: cloudcover,
                        humidity: humidity,
                        localObsDateTime: localObsDateTime,
                        observationTime: observationTime,
                        precipInches: precipInches,
                        precipMM: precipMM,
                        pressure: pressure,
                        pressureInches: pressureInches,
                        tempC: tempC,
                        tempF: tempF,
                        uvIndex: uvIndex,
                        visibility: visibility,
                        visibilityMiles: visibilityMiles,
                        weatherCode: weatherCode,
                        weatherDesc: weatherDesc?.map { $0.toDomain() },
                        weatherIconURL: weatherIconURL?.map { $0.toDomain() },
                        winddir16Point: winddir16Point,
                        winddirDegree: winddirDegree,
                        windspeedKmph: windspeedKmph,
                        windspeedMiles: windspeedMiles)
    }
}

extension ConditionDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case cloudcover = "cloudcover"
        case humidity = "humidity"
        case localObsDateTime = "localObsDateTime"
        case observationTime = "observation_time"
        case precipInches = "precipInches"
        case precipMM = "precipMM"
        case pressure = "pressure"
        case pressureInches = "pressureInches"
        case tempC = "temp_C"
        case tempF = "temp_F"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case visibilityMiles = "visibilityMiles"
        case weatherCode = "weatherCode"
        case weatherDesc = "weatherDesc"
        case weatherIconURL = "weatherIconUrl"
        case winddir16Point = "winddir16Point"
        case winddirDegree = "winddirDegree"
        case windspeedKmph = "windspeedKmph"
        case windspeedMiles = "windspeedMiles"
    }
}

// MARK: CurrentCondition convenience initializers and mutators

public extension ConditionDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(ConditionDTO.self, from: data)
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
        feelsLikeC: String?? = nil,
        feelsLikeF: String?? = nil,
        cloudcover: String?? = nil,
        humidity: String?? = nil,
        localObsDateTime: String?? = nil,
        observationTime: String?? = nil,
        precipInches: String?? = nil,
        precipMM: String?? = nil,
        pressure: String?? = nil,
        pressureInches: String?? = nil,
        tempC: String?? = nil,
        tempF: String?? = nil,
        uvIndex: String?? = nil,
        visibility: String?? = nil,
        visibilityMiles: String?? = nil,
        weatherCode: String?? = nil,
        weatherDesc: [DescriptionDTO]?? = nil,
        weatherIconURL: [DescriptionDTO]?? = nil,
        winddir16Point: String?? = nil,
        winddirDegree: String?? = nil,
        windspeedKmph: String?? = nil,
        windspeedMiles: String?? = nil
    ) -> ConditionDTO {
        return ConditionDTO(
            feelsLikeC: feelsLikeC ?? self.feelsLikeC,
            feelsLikeF: feelsLikeF ?? self.feelsLikeF,
            cloudcover: cloudcover ?? self.cloudcover,
            humidity: humidity ?? self.humidity,
            localObsDateTime: localObsDateTime ?? self.localObsDateTime,
            observationTime: observationTime ?? self.observationTime,
            precipInches: precipInches ?? self.precipInches,
            precipMM: precipMM ?? self.precipMM,
            pressure: pressure ?? self.pressure,
            pressureInches: pressureInches ?? self.pressureInches,
            tempC: tempC ?? self.tempC,
            tempF: tempF ?? self.tempF,
            uvIndex: uvIndex ?? self.uvIndex,
            visibility: visibility ?? self.visibility,
            visibilityMiles: visibilityMiles ?? self.visibilityMiles,
            weatherCode: weatherCode ?? self.weatherCode,
            weatherDesc: weatherDesc ?? self.weatherDesc,
            weatherIconURL: weatherIconURL ?? self.weatherIconURL,
            winddir16Point: winddir16Point ?? self.winddir16Point,
            winddirDegree: winddirDegree ?? self.winddirDegree,
            windspeedKmph: windspeedKmph ?? self.windspeedKmph,
            windspeedMiles: windspeedMiles ?? self.windspeedMiles
        )
    }

    func jsonData() throws -> Data {
        return try JSONSchemaSupport.encoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
