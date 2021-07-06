//
//  HourlyDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

// MARK: - Hourly
public struct HourlyDTO {
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
    public var weatherDesc: [DescriptionDTO]?
    public var weatherIconURL: [DescriptionDTO]?
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
                weatherDesc: [DescriptionDTO]?,
                weatherIconURL: [DescriptionDTO]?,
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

extension HourlyDTO {
    func toDomain() -> Hourly {
        return Hourly(dewPointC: dewPointC,
                      dewPointF: dewPointF,
                      feelsLikeC: feelsLikeC,
                      feelsLikeF: feelsLikeF,
                      heatIndexC: heatIndexC,
                      heatIndexF: heatIndexF,
                      windChillC: windChillC,
                      windChillF: windChillF,
                      windGustKmph: windGustKmph,
                      windGustMiles: windGustMiles,
                      chanceoffog: chanceoffog,
                      chanceoffrost: chanceoffrost,
                      chanceofhightemp: chanceofhightemp,
                      chanceofovercast: chanceofovercast,
                      chanceofrain: chanceofrain,
                      chanceofremdry: chanceofremdry,
                      chanceofsnow: chanceofsnow,
                      chanceofsunshine: chanceofsunshine,
                      chanceofthunder: chanceofthunder,
                      chanceofwindy: chanceofwindy,
                      cloudcover: cloudcover,
                      humidity: humidity,
                      precipInches: precipInches,
                      precipMM: precipMM,
                      pressure: pressure,
                      pressureInches: pressureInches,
                      tempC: tempC,
                      tempF: tempF,
                      time: time,
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

extension HourlyDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case dewPointC = "DewPointC"
        case dewPointF = "DewPointF"
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case heatIndexC = "HeatIndexC"
        case heatIndexF = "HeatIndexF"
        case windChillC = "WindChillC"
        case windChillF = "WindChillF"
        case windGustKmph = "WindGustKmph"
        case windGustMiles = "WindGustMiles"
        case chanceoffog = "chanceoffog"
        case chanceoffrost = "chanceoffrost"
        case chanceofhightemp = "chanceofhightemp"
        case chanceofovercast = "chanceofovercast"
        case chanceofrain = "chanceofrain"
        case chanceofremdry = "chanceofremdry"
        case chanceofsnow = "chanceofsnow"
        case chanceofsunshine = "chanceofsunshine"
        case chanceofthunder = "chanceofthunder"
        case chanceofwindy = "chanceofwindy"
        case cloudcover = "cloudcover"
        case humidity = "humidity"
        case precipInches = "precipInches"
        case precipMM = "precipMM"
        case pressure = "pressure"
        case pressureInches = "pressureInches"
        case tempC = "tempC"
        case tempF = "tempF"
        case time = "time"
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

// MARK: Hourly convenience initializers and mutators

public extension HourlyDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(HourlyDTO.self, from: data)
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
        dewPointC: String?? = nil,
        dewPointF: String?? = nil,
        feelsLikeC: String?? = nil,
        feelsLikeF: String?? = nil,
        heatIndexC: String?? = nil,
        heatIndexF: String?? = nil,
        windChillC: String?? = nil,
        windChillF: String?? = nil,
        windGustKmph: String?? = nil,
        windGustMiles: String?? = nil,
        chanceoffog: String?? = nil,
        chanceoffrost: String?? = nil,
        chanceofhightemp: String?? = nil,
        chanceofovercast: String?? = nil,
        chanceofrain: String?? = nil,
        chanceofremdry: String?? = nil,
        chanceofsnow: String?? = nil,
        chanceofsunshine: String?? = nil,
        chanceofthunder: String?? = nil,
        chanceofwindy: String?? = nil,
        cloudcover: String?? = nil,
        humidity: String?? = nil,
        precipInches: String?? = nil,
        precipMM: String?? = nil,
        pressure: String?? = nil,
        pressureInches: String?? = nil,
        tempC: String?? = nil,
        tempF: String?? = nil,
        time: String?? = nil,
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
    ) -> HourlyDTO {
        return HourlyDTO(
            dewPointC: dewPointC ?? self.dewPointC,
            dewPointF: dewPointF ?? self.dewPointF,
            feelsLikeC: feelsLikeC ?? self.feelsLikeC,
            feelsLikeF: feelsLikeF ?? self.feelsLikeF,
            heatIndexC: heatIndexC ?? self.heatIndexC,
            heatIndexF: heatIndexF ?? self.heatIndexF,
            windChillC: windChillC ?? self.windChillC,
            windChillF: windChillF ?? self.windChillF,
            windGustKmph: windGustKmph ?? self.windGustKmph,
            windGustMiles: windGustMiles ?? self.windGustMiles,
            chanceoffog: chanceoffog ?? self.chanceoffog,
            chanceoffrost: chanceoffrost ?? self.chanceoffrost,
            chanceofhightemp: chanceofhightemp ?? self.chanceofhightemp,
            chanceofovercast: chanceofovercast ?? self.chanceofovercast,
            chanceofrain: chanceofrain ?? self.chanceofrain,
            chanceofremdry: chanceofremdry ?? self.chanceofremdry,
            chanceofsnow: chanceofsnow ?? self.chanceofsnow,
            chanceofsunshine: chanceofsunshine ?? self.chanceofsunshine,
            chanceofthunder: chanceofthunder ?? self.chanceofthunder,
            chanceofwindy: chanceofwindy ?? self.chanceofwindy,
            cloudcover: cloudcover ?? self.cloudcover,
            humidity: humidity ?? self.humidity,
            precipInches: precipInches ?? self.precipInches,
            precipMM: precipMM ?? self.precipMM,
            pressure: pressure ?? self.pressure,
            pressureInches: pressureInches ?? self.pressureInches,
            tempC: tempC ?? self.tempC,
            tempF: tempF ?? self.tempF,
            time: time ?? self.time,
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
